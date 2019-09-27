import './../redux/models/inventory.dart';

class ProductViewModel {
  String name;
  double cost;

  
  void setName(String name) {
    this.name = name;
  }

  void setCost(double cost) {
    this.cost = cost;
  }

  Product createStock() {
    return new Product(name: this.name, cost: this.cost);
  }

  ProductViewModel();
}