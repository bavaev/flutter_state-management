import 'package:flutter/material.dart';

import 'package:homework_13/ui/bloc/list_page.dart';

class BlocP extends StatelessWidget {
  const BlocP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}
