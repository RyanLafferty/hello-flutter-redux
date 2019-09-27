import './../models/inventory.dart';


class AddStock {
  static int _id = 0;
  final Product product;
  final int quantity;

  AddStock(this.product, this.quantity) {
    _id++;
  }

  int get id => _id;
}