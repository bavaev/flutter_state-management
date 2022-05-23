import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:homework_13/data/get_data.dart';
import 'package:homework_13/ui/bloc/item_card.dart';
import 'package:homework_13/business/bloc/cart_bloc.dart';

class ListPage extends StatelessWidget {
  final CartBloc _bloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
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
      floatingActionButton: StreamBuilder(
        stream: _bloc.outputStateStream,
        initialData: [],
        builder: (context, AsyncSnapshot snapshot) {
          return FloatingActionButton.extended(
            onPressed: null,
            label: Text(snapshot.data.length.toString()),
            icon: snapshot.data.isNotEmpty ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.shopping_cart_outlined),
          );
        },
      ),
    );
  }
}
