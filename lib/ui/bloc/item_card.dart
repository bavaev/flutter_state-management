import 'package:flutter/material.dart';

import 'package:homework_13/business/bloc/cart_bloc.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final CartBloc bloc;
  final bool contain;

  const ItemCard({
    Key? key,
    required this.item,
    required this.bloc,
    required this.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            icon: contain ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.add_shopping_cart_outlined),
            onPressed: () => bloc.inputEventSink.add(CartEvent(item['id'])),
          ),
        ],
      ),
    );
  }
}
