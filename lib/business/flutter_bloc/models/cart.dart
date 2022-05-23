import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.items = const <String>[]});

  final List<String> items;

  @override
  List<Object> get props => [items];
}
