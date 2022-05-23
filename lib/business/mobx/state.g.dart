// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartAction on _CartAction, Store {
  late final _$valueAtom = Atom(name: '_CartAction.value', context: context);

  @override
  List<String> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(List<String> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$listFutureAtom =
      Atom(name: '_CartAction.listFuture', context: context);

  @override
  ObservableFuture<List<String>> get listFuture {
    _$listFutureAtom.reportRead();
    return super.listFuture;
  }

  @override
  set listFuture(ObservableFuture<List<String>> value) {
    _$listFutureAtom.reportWrite(value, super.listFuture, () {
      super.listFuture = value;
    });
  }

  late final _$cartActionAsyncAction =
      AsyncAction('_CartAction.cartAction', context: context);

  @override
  Future<void> cartAction(String id) {
    return _$cartActionAsyncAction.run(() => super.cartAction(id));
  }

  @override
  String toString() {
    return '''
value: ${value},
listFuture: ${listFuture}
    ''';
  }
}
