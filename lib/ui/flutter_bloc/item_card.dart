import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:homework_13/business/flutter_bloc/bloc/cart_bloc.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return state.cart.items.contains(item['id'])
                    ? IconButton(
                        icon: const Icon(Icons.shopping_cart_rounded),
                        onPressed: () => context.read<CartBloc>().add(CartItemRemoved(item['id'])),
                      )
                    : IconButton(
                        icon: const Icon(Icons.add_shopping_cart_outlined),
                        onPressed: () => context.read<CartBloc>().add(CartItemAdded(item['id'])),
                      );
              }
              return const Center(
                child: Text('Something went wrong!'),
              );
            },
          )
        ],
      ),
    );
  }
}
