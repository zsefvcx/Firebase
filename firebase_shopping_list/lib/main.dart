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

  Future<void> _add() async {
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
    await _showCustomDialog(vis, data);
    developer.log(PurchasesList().toString());
    setState(() {_readListData = _readList();});
  }

  Future<bool> _readList() async {
    try {
      await Future.delayed(const Duration(microseconds: 100));
      return true;
    } catch (e) {
      developer.log(e.toString());
      return false;
    }
  }

  Future<void> _showCustomDialog(List<bool> vis, Purchase dt) async {
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
        PurchasesList.rem(data.id);
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

  late Future<bool> _readListData;

  @override
  void initState() {
    super.initState();
    _readListData = _readList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<bool>(
              future: _readListData,
              builder: (_, snap) {
                //final width = MediaQuery.of(context).size.width;
                //print('FutureBuilder');
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snap.connectionState == ConnectionState.done) {
                  if (snap.hasData) {
                    bool status = snap.data ?? false;
                    if(status)
                    {
                      int length = PurchasesList.length;
                      return ListView.builder(
                          itemCount: length,
                          itemBuilder: (_, index) {
                            Purchase purchase = PurchasesList.get(index)!;
                            bool bought =  purchase.bought;
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () async {
                                  //              = [Add  , Mod , Brk , Rem ,];
                                  List<bool> vis1 = [false, true, true, false,];
                                  await _showCustomDialog(vis1, purchase);
                                  developer.log(PurchasesList().toString());
                                  setState(() {_readListData = _readList();});
                                },
                                child: SizedBox(
                                    width: double.infinity,
                                    height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Expanded(
                                              child: MouseRegion(
                                                cursor: SystemMouseCursors.click,
                                                child: Text(purchase.toString(),
                                                  style: TextStyle(
                                                    backgroundColor: Colors.lightGreenAccent.withOpacity(0.1),
                                                    decoration: bought?TextDecoration.lineThrough:null,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text('Buy'),
                                                    Switch(
                                                      value: bought,
                                                      activeColor: Colors.red,
                                                      onChanged: (bool value) {
                                                        if(bought != value) {
                                                          PurchasesList.mod(purchase.copyWith(
                                                            bought: value,
                                                          ));
                                                          bought = value;
                                                          setState(() {
                                                             //_readListData = _readList();
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      PurchasesList.rem(index);
                                                      setState(() {_readListData = _readList();});
                                                    },
                                                    child: const Text('Remove')),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            );
                          });
                    }
                  }
                  return Center(
                    child: Column(children: [
                      const Text('hasError'),
                      ElevatedButton(
                          onPressed: () => setState(() {_readListData = _readList();}),
                          child: const Text('Refresh'))
                    ]),
                  );
                } else if (snap.hasError) {
                  return Center(
                    child: Column(children: [
                      const Text('hasError'),
                      ElevatedButton(
                          onPressed: () => setState(() {_readListData = _readList();}),
                          child: const Text('Refresh'))
                    ]),
                  );
                } else {
                  return Center(
                    child: Column(children: [
                      const Text('no data'),
                      ElevatedButton(
                          onPressed: () => setState(() {_readListData = _readList();}),
                          child: const Text('Refresh'))
                    ]),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: _add,
              tooltip: 'Add in ...',
              child: const Icon(Icons.add_box_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: (){
                PurchasesList.remAll();
                developer.log(PurchasesList().toString());
                setState(() {_readListData = _readList();});
              },
              tooltip: 'Remove All',
              child: const Icon(Icons.remove_shopping_cart_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
