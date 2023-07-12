import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'core/purchases.dart';
import 'widget/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Shopping List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Firebase Shopping List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {


    final int id =  PurchasesList.length;
    Purchase data = Purchase(
      id: id,
      name: '',
      count: 0,
      price: 0,
      unit: 'шт.',
      bought: false,
    );
    //             = [Add , Mod  , Brk , Rem  ,];
    List<bool> vis = [true, false, true, false,];
    await showCustomDialog(vis, data);
    developer.log(PurchasesList().toString());

    //              = [Add  , Mod , Brk , Rem ,];
    List<bool> vis1 = [false, true, true, true,];
    await showCustomDialog(vis1, data);
    developer.log(PurchasesList().toString());

    setState(() {
      _counter++;
    });
  }

  Future<void> showCustomDialog(List<bool> vis, Purchase dt) async {
     switch (await showDialog<(StatusOfAddingPurchases, Purchase)>(
      context: context,
      builder: (BuildContext context) {
        return ShoppingListModWidget(vis: vis, data: dt);
    }).then((value) {
      if (value == null){
        return (null);
      } else {
        return (value);
      }
    })) {
      case (StatusOfAddingPurchases.add, Purchase data):
        developer.log('${StatusOfAddingPurchases.add}');
        PurchasesList.add(data);
        break;
      case ((StatusOfAddingPurchases.brk, _) || (StatusOfAddingPurchases.def, _)):
        developer.log('${StatusOfAddingPurchases.brk}');
        break;
      case (StatusOfAddingPurchases.rem, Purchase data):
        developer.log('${StatusOfAddingPurchases.rem}');
        PurchasesList.rem(data);
        break;
      case (StatusOfAddingPurchases.mod, Purchase data):
        developer.log('${StatusOfAddingPurchases.mod}');
        PurchasesList.mod(data);
        break;
      case null:
        developer.log('null');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: FutureBuilder<Object>(
          future: null,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          }
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Add in ...',
            child: const Icon(Icons.add_box_outlined),
          ),
          FloatingActionButton(
            onPressed: (){
              PurchasesList.remAll();
              developer.log(PurchasesList().toString());
            },
            tooltip: 'Remove All',
            child: const Icon(Icons.remove_shopping_cart_outlined),
          ),
        ],
      ),
    );
  }
}
