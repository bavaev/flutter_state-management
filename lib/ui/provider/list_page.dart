import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:homework_13/data/get_data.dart';
import 'package:homework_13/business/items.dart';
import 'package:homework_13/ui/provider/item_card.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider'),
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
                  child: Text('Информации не найдено'),
                );
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(context.watch<Item>().list.length.toString()),
          icon: context.watch<Item>().list.isNotEmpty ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.shopping_cart_outlined),
        ));
  }
}
