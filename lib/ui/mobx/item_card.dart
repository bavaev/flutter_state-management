import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:homework_13/business/mobx/state.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartAction store = Provider.of<CartAction>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade300]),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(5, 5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item['name']),
          Observer(
            builder: (_) {
              if (store.listFuture.status == FutureStatus.fulfilled) {
                return IconButton(
                  icon: store.value.contains(item['id']) ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.add_shopping_cart_outlined),
                  onPressed: () => store.cartAction(item['id']),
                );
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
