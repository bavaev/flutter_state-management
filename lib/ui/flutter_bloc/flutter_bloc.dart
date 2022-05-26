import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:homework_13/business/flutter_bloc/bloc/cart_bloc.dart';
import 'package:homework_13/business/flutter_bloc/models/cart_action.dart';
import 'package:homework_13/ui/flutter_bloc/list_page.dart';

class FlutterBloc extends StatelessWidget {
  const FlutterBloc({Key? key, required this.cartAction}) : super(key: key);

  final CartAction cartAction;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CartBloc>(
        create: (context) => CartBloc(
          cartAction: cartAction,
        )..add(CartStarted()),
        child: const ListPage(),
      ),
    );
  }
}
