import 'dart:async';

const _delay = Duration(milliseconds: 800);

class CartAction {
  final _items = <String>[];

  Future<List<String>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(String item) => _items.add(item);

  void removeItemFromCart(String item) => _items.remove(item);
}
