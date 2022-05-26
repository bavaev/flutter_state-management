import 'package:flutter/material.dart';

import 'package:homework_13/business/bloc/cart_bloc.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  ItemCard({Key? key, required this.item}) : super(key: key);

  final CartBloc _bloc = CartBloc();

  void dispose() {
    _bloc.dispose();
  }

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
          StreamBuilder(
            stream: _bloc.outputStateStream,
            initialData: const [],
            builder: (context, AsyncSnapshot snapshot) {
              return snapshot.data.contains(item['id'])
                  ? IconButton(
                      icon: const Icon(Icons.shopping_cart_rounded),
                      onPressed: () => _bloc.inputEventSink.add(CartEvent(item['id'])),
                    )
                  : IconButton(
                      icon: const Icon(Icons.add_shopping_cart_outlined),
                      onPressed: () => _bloc.inputEventSink.add(CartEvent(item['id'])),
                    );
            },
          )
        ],
      ),
    );
  }
}
