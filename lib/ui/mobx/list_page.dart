import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:homework_13/data/get_data.dart';
import 'package:homework_13/business/mobx/state.dart';
import 'package:homework_13/ui/mobx/item_card.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final CartAction store = Provider.of<CartAction>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX'),
      ),
      body: FutureBuilder(
        future: fetchFile('assets/furniture.json'),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              List<dynamic> items = jsonDecode(snapshot.data);
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(item: items[index]);
                },
              );
            default:
              return const Center(
                child: Text('Data not found'),
              );
          }
        },
      ),
      floatingActionButton: Observer(builder: (_) {
        if (store.listFuture.status == FutureStatus.fulfilled) {
          return FloatingActionButton.extended(
            onPressed: () {},
            label: Text(store.value.length.toString()),
            icon: store.value.isNotEmpty ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.shopping_cart_outlined),
          );
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}
