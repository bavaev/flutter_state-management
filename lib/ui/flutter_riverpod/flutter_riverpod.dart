import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:homework_13/ui/flutter_riverpod/list_page.dart';
import 'package:homework_13/business/items.dart';

final flutterRiverpod = ChangeNotifierProvider((ref) => Item());

class FlutterRiverpod extends StatelessWidget {
  const FlutterRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Riverpod',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListPage(),
      ),
    );
  }
}
