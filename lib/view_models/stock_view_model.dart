import './../redux/models/inventory.dart';

class StockViewModel {
  Product product;
  int quantity;

  void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  Stock createStock() {
    return new Stock(product: this.product, quantity: this.quantity);
  }

  StockViewModel();
}