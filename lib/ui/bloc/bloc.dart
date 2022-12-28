import 'package:flutter/material.dart';

import 'package:homework_13/ui/bloc/list_page.dart';

class BlocStream extends StatelessWidget {
  const BlocStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattern BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}
