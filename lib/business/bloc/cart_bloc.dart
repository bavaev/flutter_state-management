import 'dart:async';

class CartEvent {
  CartEvent(this.id);

  final String id;
}

class CartBloc {
  final List<String> _cart = [];

  final _inputEventController = StreamController<CartEvent>.broadcast();
  StreamSink<CartEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<List<String>>();
  Stream<List<String>> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(CartEvent event) {
    _cart.contains(event.id) ? _cart.remove(event.id) : _cart.add(event.id);

    _outputStateController.sink.add(_cart);
  }

  CartBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
