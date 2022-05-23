import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:homework_13/ui/provider/list_page.dart';
import 'package:homework_13/business/items.dart';

class Provider extends StatelessWidget {
  const Provider({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Item>(
      create: (context) => Item(),
      child: MaterialApp(
        title: 'Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListPage(),
      ),
    );
  }
}
