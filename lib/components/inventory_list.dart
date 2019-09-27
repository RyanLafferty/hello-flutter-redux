import 'package:flutter/material.dart';

import './product_field.dart';
import './../redux/models/inventory.dart';


class InventoryList extends StatelessWidget {
  final List<Stock> inventory;
  InventoryList({Key key, @required this.inventory}) : super(key: key);

  Widget build(BuildContext context) {
    if(this.inventory != null) {
      return new Container(
        child: new Column(
          children: new List<ProductField>.generate(
                      this.inventory.length, (i) =>
                      new ProductField(
                        product: this.inventory[i].product,
                        quantity: this.inventory[i].quantity
                      )
                    )
        ),
      );
    }

    return new Container(
        child: new Column(
        children: <Widget>[new Text('Empty Inventory')]
      ),
    ); 
  } 
}