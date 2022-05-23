import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:homework_13/business/redux/state.dart';

class ItemCard extends StatelessWidget {
  final item;

  const ItemCard({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<List<String>> store = StoreProvider.of<List<String>>(context);
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
          StoreConnector<List<String>, List<String>>(
              converter: ((store) => store.state),
              builder: (context, state) {
                return state.contains(item['id'])
                    ? IconButton(icon: const Icon(Icons.shopping_cart_rounded), onPressed: () => store.dispatch(CartAction(item['id'])))
                    : IconButton(icon: const Icon(Icons.add_shopping_cart_outlined), onPressed: () => store.dispatch(CartAction(item['id'])));
              }),
        ],
      ),
    );
  }
}
