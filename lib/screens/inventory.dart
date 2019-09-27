import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './../redux/models/model.dart';
import './../view_model.dart';
import './../containers/inventory_form.dart';

class InventoryScreen extends StatelessWidget {
  final String title = 'Inventory';

  InventoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new InventoryForm(),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
            // accessing store through view model
            new StoreConnector<AppState, ViewModel>(
              converter: (store) => ViewModel.create(store),
              builder: (context, ViewModel viewModel) {
                return new Text(
                  "${viewModel.count}",
                  style: Theme.of(context).textTheme.display1,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}