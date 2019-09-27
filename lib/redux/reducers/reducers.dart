import 'package:redux/redux.dart';
import './../models/model.dart';
import './../models/inventory.dart';
import './../actions/inventory.dart';
import './../actions/counter.dart';


List <Stock> addStockReducer(List<Stock> state, action) {
  return []
    ..addAll(state)
    ..add(Stock(product: action.product, quantity: action.quantity));
}

final Reducer <List<Stock>> inventoryReducer = combineReducers <List<Stock>>([
  new TypedReducer<List<Stock>, AddStock>(addStockReducer),
]);

int incrementReducer(int state, action) {
  if (action == CounterActions.Increment) {
    return state + 1;
  }
  return state;
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    inventory: inventoryReducer(state.inventory, action),
    count: incrementReducer(state.count, action),
  );
}