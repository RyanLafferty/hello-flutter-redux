import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final double cost;

  Product({
    @required this.name,
    @required this.cost
  });
}

class Stock {
  final Product product;
  final int quantity;

  Stock({
    @required this.product,
    @required this.quantity
  });
}