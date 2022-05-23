import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:homework_13/data/get_data.dart';
import 'package:homework_13/business/flutter_bloc/cart.dart';
import 'package:homework_13/ui/flutter_bloc/item_card.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
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
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return FloatingActionButton.extended(
              onPressed: null,
              label: Text(state.cart.items.length.toString()),
              icon: state.cart.items.isNotEmpty ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.shopping_cart_outlined),
            );
          }
          return const Text('Something went wrong!');
        },
      ),
    );
  }
}
