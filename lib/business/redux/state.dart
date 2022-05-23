class CartAction {
  final String item;

  CartAction(this.item);
}

List<String> reducer(List<String> state, dynamic action) {
  if (action is CartAction) {
    if (state.contains(action.item)) {
      state.remove(action.item);
      return state;
    } else {
      state.add(action.item);
      return state;
    }
  }
  return state;
}
