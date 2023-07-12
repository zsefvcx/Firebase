import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'core/purchases.dart';

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
    Purchase purchase1 = const Purchase(
      id: 0,
      name: 'bred',
      count: 1,
      price: 100,
      unit: 'шт.',
      bought: false,
    );
    Purchase purchase2 = const Purchase(
      id: 0,
      name: 'bred',
      count: 1,
      price: 100,
      unit: 'шт.',
      bought: false,
    );

    PurchasesList purchasesList = PurchasesList(purchases: [purchase1]);
    PurchasesList purchasesList1 = PurchasesList(purchases: [purchase2]);

    developer.log('${purchasesList==purchasesList1}');

    purchasesList.purchases.add(purchase2);

    developer.log('${purchasesList==purchasesList1}');

    developer.log('${purchasesList.purchases.length}');

    purchasesList.purchases.add(purchase2);

    developer.log('${purchasesList.purchases.length}');

    switch (await showDialog<StatusOfAddingPurchases>(
      context: context,
      builder: (BuildContext context) {
        //bool light = true;
        return SimpleDialog(
          title: const Center(child: Text('Add a purchase to the Shopping List')),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Icon(Icons.shopping_basket_outlined),
                  ),
                  labelText: 'Purchase *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                maxLines:   1,
                maxLength: 40,
                initialValue: '',
                validator: (String? value) {
                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Icon(Icons.currency_ruble),
                        ),
                        labelText: 'Price *',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      maxLines:   1,
                      maxLength: 14,
                      initialValue: '0',

                      validator: (String? value) {
                        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Icon(Icons.filter_9_plus_outlined),
                        ),
                        labelText: 'Count *',
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      maxLines:   1,
                      maxLength: 14,
                      initialValue: '0',
                      validator: (String? value) {
                        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Icon(Icons.type_specimen_outlined),

                          ),
                          labelText: 'Unit *',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        maxLines:   1,
                        maxLength: 3,

                        validator: (String? value) {
                          return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                        },
                      ),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Row(
                  //     children: [
                  //       const Text('Bought'),
                  //       Switch(
                  //
                  //         // This bool value toggles the switch.
                  //         value: light,
                  //         activeColor: Colors.red,
                  //         onChanged: (bool value) {
                  //         // This is called when the user toggles the switch.
                  //           setState(() {
                  //             light = value;
                  //           });
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: SimpleDialogOption(
                      onPressed: () { Navigator.pop(context, StatusOfAddingPurchases.add); },
                      child: const Center(child: Text('Add')),
                    ),
                  ),
                  Expanded(
                    child: SimpleDialogOption(
                      onPressed: () { Navigator.pop(context, StatusOfAddingPurchases.brk); },
                      child: const Center(child: Text('Cancel')),
                    ),
                  ),
                ],
              ),
            ),
          ],

        );
    }).then((value) {
      if (value == null){
        return StatusOfAddingPurchases.def;
      } else {
        return value;
      }
    })) {
      case StatusOfAddingPurchases.add:
        developer.log('${StatusOfAddingPurchases.add}');
      // Let's go.
      // ...
      break;
      case StatusOfAddingPurchases.brk:
        developer.log('${StatusOfAddingPurchases.brk}');
      // ...
      break;
      case StatusOfAddingPurchases.def:
        developer.log('${StatusOfAddingPurchases.def}');
      // dialog dismissed
      break;
    }





    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
