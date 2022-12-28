import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:homework_13/data/get_data.dart';
import 'package:homework_13/ui/bloc/item_card.dart';
import 'package:homework_13/business/bloc/cart_bloc.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);

  final CartBloc _bloc = CartBloc();
  late List<String> cart;

  void dispose() {
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.outputStateStream,
      builder: (context, snapshot) {
        cart = snapshot.hasData ? snapshot.data as List<String> : [];
        return Scaffold(
          appBar: AppBar(
            title: const Text('Pattern BLoC'),
          ),
          body: FutureBuilder(
            future: fetchFile('assets/furniture.json'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                      return ItemCard(
                        item: items[index],
                        bloc: _bloc,
                        contain: cart.contains(items[index]['id']),
                      );
                    },
                  );
                default:
                  return const Center(
                    child: Text('Data not found'),
                  );
              }
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: null,
            label: Text(cart.isNotEmpty ? cart.length.toString() : '0'),
            icon: cart.isNotEmpty ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.shopping_cart_outlined),
          ),
        );
      },
    );
  }
}
