import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:homework_13/ui/mobx/list_page.dart';
import 'package:homework_13/business/mobx/state.dart';

class MobX extends StatelessWidget {
  const MobX({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CartAction(),
      child: MaterialApp(
        title: 'MobX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListPage(),
      ),
    );
  }
}
