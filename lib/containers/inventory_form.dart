import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './../redux/models/model.dart';
import './../view_model.dart';
import './../view_models/product_view_model.dart';
import './../components/inventory_list.dart';


class InventoryForm extends StatefulWidget {
  @override
  _InventoryForm createState() => _InventoryForm();
}

class _InventoryForm extends State<InventoryForm> {
  ProductViewModel productViewModel = new ProductViewModel();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          new TextField(
            decoration: InputDecoration(
              hintText: 'Product Name'
            ),
            onChanged: (value) {
              productViewModel.setName(value);
              print(productViewModel.name);
            },
          ),
          new TextField(
            decoration: new InputDecoration(labelText: "Cost"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              productViewModel.setCost(double.parse(value));
              print(productViewModel.cost);
            },
          ),
          new TextField(
            decoration: new InputDecoration(labelText: "Quantity"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              quantity = int.parse(value);
              print(quantity);
            },
          ),
          new StoreConnector<AppState, ViewModel>(
            converter: (store) => ViewModel.create(store),
            builder: (context, ViewModel viewModel) {
            return new RaisedButton(
              onPressed: () {
                viewModel.addStock(productViewModel.createStock(), quantity);
              },
              child: const Text('Add Stock'),
            );
          }),
          new Text('Inventory:'),
          new Text('=========='),
          new StoreConnector<AppState, ViewModel>(
            converter: (store) => ViewModel.create(store),
            builder: (context, ViewModel viewModel) {
            return new InventoryList(inventory: viewModel.inventory);
          })
        ],
      ),
    );
  }
}