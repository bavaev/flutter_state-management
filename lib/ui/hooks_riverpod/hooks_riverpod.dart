import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:homework_13/ui/hooks_riverpod/list_page.dart';
import 'package:homework_13/business/items.dart';

final flutterRiverpod = ChangeNotifierProvider((ref) => Item());

class FlutterHooksRiverpod extends StatelessWidget {
  const FlutterHooksRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Hooks Riverpod',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListPage(),
      ),
    );
  }
}
