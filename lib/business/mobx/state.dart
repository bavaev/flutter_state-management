import 'package:mobx/mobx.dart';

part 'state.g.dart';

class CartAction = _CartAction with _$CartAction;

abstract class _CartAction with Store {
  @observable
  List<String> value = [];

  static ObservableFuture<List<String>> empty = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<String>> listFuture = empty;

  @observable
  @action
  Future<void> cartAction(String id) async {
    print(listFuture);
    listFuture = ObservableFuture(loadCartItems(value));
    List<String> list = await listFuture;
    list.contains(id) ? value.remove(id) : value.add(id);
  }
}

Future<List<String>> loadCartItems(List<String> list) => Future.delayed(const Duration(milliseconds: 1), () => list);
