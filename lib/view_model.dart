import 'package:redux/redux.dart';

import 'redux/models/model.dart';
import 'redux/models/inventory.dart';
import 'redux/actions/counter.dart';
import 'redux/actions/inventory.dart';

class ViewModel {
  final int count;
  final List<Stock> inventory;
  final Function(Product, int) addStock;
  final Function() increment;

  ViewModel({
    this.count,
    this.inventory,
    this.increment,
    this.addStock
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddStock(Product product, int quantity) {
      store.dispatch(AddStock(product, quantity));
    }

    _onIncrement() {
      store.dispatch(CounterActions.Increment);
    }

    return ViewModel(
      count: store.state.count,
      inventory: store.state.inventory,
      increment: _onIncrement,
      addStock: _onAddStock,
    );
  }
}