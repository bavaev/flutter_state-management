import 'package:flutter/material.dart';

class Item extends ChangeNotifier {
  String? id;
  String? name;
  List cartList = [];

  Item({this.id, this.name});

  get list => cartList;

  void cart(String id) {
    cartList.contains(id) ? cartList.remove(id) : cartList.add(id);
    notifyListeners();
  }
}
