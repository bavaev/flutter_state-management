import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:homework_13/ui/redux/list_page.dart';
import 'package:homework_13/business/redux/state.dart';

class FlutterRedux extends StatelessWidget {
  const FlutterRedux({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<List<String>> store = Store(reducer, initialState: []);
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Redux',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListPage(),
      ),
    );
  }
}
