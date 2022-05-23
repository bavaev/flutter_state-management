import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:homework_13/ui/flutter_riverpod/flutter_riverpod.dart';
import 'package:homework_13/business/items.dart';

class ItemCard extends ConsumerWidget {
  final item;

  const ItemCard({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Consumer(builder: (context, ref, _) {
            return ref.watch(flutterRiverpod).list.contains(item['id'])
                ? IconButton(icon: const Icon(Icons.shopping_cart_rounded), onPressed: () => ref.read(flutterRiverpod).cart(item['id']))
                : IconButton(icon: const Icon(Icons.add_shopping_cart_outlined), onPressed: () => ref.read(flutterRiverpod).cart(item['id']));
          }),
        ],
      ),
    );
  }
}
