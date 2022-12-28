import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:homework_13/ui/riverpod/list_page.dart';
import 'package:homework_13/business/items.dart';

final riverpod = ChangeNotifierProvider((ref) => Item());

class Riverpod extends StatelessWidget {
  const Riverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Riverpod',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListPage(),
      ),
    );
  }
}
