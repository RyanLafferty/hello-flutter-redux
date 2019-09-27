import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/models/model.dart';
import 'redux/actions/counter.dart';
import 'redux/reducers/reducers.dart';
import 'screens/inventory.dart';
import 'view_model.dart';


void main() {
  final Store store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
  );

  runApp(new FlutterReduxApp(
    title: 'Hello Flutter Redux',
    store: store,
  ));
}

// TODO: Move homepage outside of this class
class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.dark(),
        title: title,
        // TODO: Move routes definition into its own class / middleware
        routes: <String, WidgetBuilder>{
          '/inventory': (BuildContext context) => new InventoryScreen(),
        },
        home: Builder (
          builder: (context) => new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () => Navigator.of(context).pushNamed('/inventory'),
                      child: new Text("Edit Inventory"),
                  ),
                  new Text(
                    'You have pushed the button this many times:',
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
            // accessing store directly
            floatingActionButton: new StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                // Return a `VoidCallback`, which is a fancy name for a function
                // with no parameters. It only dispatches an Increment action.
                return () => store.dispatch(CounterActions.Increment);
              },
              builder: (context, callback) {
                return new FloatingActionButton(
                  // Attach the `callback` to the `onPressed` attribute
                  onPressed: callback,
                  tooltip: 'Increment Counter',
                  child: new Icon(Icons.add),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
