import 'package:flutter/foundation.dart';
import 'inventory.dart';

class AppState {
  final List<Stock> inventory;
  final int count;

  AppState({
    @required this.inventory,
    @required this.count
  });

  AppState.initialState() : 
    inventory = List.unmodifiable(<Stock>[]),
    count = 0;
}