import 'package:flutter/material.dart';
import './../redux/models/inventory.dart';


class ProductField extends StatelessWidget {
  final Product product;
  int quantity;

  ProductField({
    Key key,
    @required this.product,
    @required this.quantity
  }) : super(key: key);

  Widget build(BuildContext context) {
    return new Container(
        child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: new Text(this.product.name)
          ),
          new Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: new Text("Cost: \$${this.product.cost.toString()}")
          ),
          new Container(
            child: new Text("Quantity: ${this.quantity.toString()}")
          )
        ]
      ),
    ); 
  } 
}