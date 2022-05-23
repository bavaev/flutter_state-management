import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:convert';

import 'package:homework_13/data/get_data.dart';
import 'package:homework_13/ui/hooks_riverpod/hooks_riverpod.dart';
import 'package:homework_13/ui/hooks_riverpod/item_card.dart';

class ListPage extends ConsumerStatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hooks Riverpod'),
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
          label: Consumer(
            builder: ((context, ref, _) => Text(ref.watch(flutterRiverpod).list.length.toString())),
          ),
          icon: Consumer(
            builder: ((context, ref, _) =>
                ref.watch(flutterRiverpod).list.isNotEmpty ? const Icon(Icons.shopping_cart_rounded) : const Icon(Icons.shopping_cart_outlined)),
          ),
        ));
  }
}
