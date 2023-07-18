import 'dart:developer' as developer;
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_shopping_list/domain/domain.dart';
import 'package:firebase_shopping_list/widget/widget.dart';
import 'package:flutter/material.dart';

import 'core/purchases.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
    final int id = PurchasesList.length;
    Purchase data = Purchase(
      id: id,
      name: '',
      count: 0,
      price: 0,
      unit: 'шт.',
      bought: false,
      group: false,
      groupId: -1,
    );
    //             = [Add , Mod  , Brk , Rem   ];
    List<bool> vis = [
      true,
      false,
      true,
      false,
    ];
    await showCustomDialog(vis, data, context);
    developer.log(PurchasesList().toString());
    setState(() {
      _readListData = _readList();
    });
  }

  Future<bool> _readList() async {
    try {
      await Future.delayed(const Duration(milliseconds: 5));
      return true;
    } catch (e) {
      developer.log(e.toString());
      return false;
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
                } else if (snap.connectionState  == ConnectionState.done) {
                  if (snap.hasData) {
                    bool status = snap.data ?? false;
                    if (status) {
                      int length = PurchasesList.length;
                      return RefreshIndicator(
                        onRefresh: () async {
                          _readListData = _readList();
                          await _readListData;
                        },
                        child: ScrollConfiguration(
                          // + windows
                          behavior: ScrollConfiguration.of(context).copyWith(
                            dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse,
                            },
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: length,
                                    itemBuilder: (_, id) {
                                      Purchase purchase = PurchasesList.get(id)!;
                                      bool bought = purchase.bought;
                                      bool group = purchase.group;
                                      return Card(
                                        elevation: 5,
                                        margin: const EdgeInsets.all(10),
                                        child: GestureDetector(
                                          onTap: () async {
                                            //              = [Add  , Mod , Brk , Rem ,];
                                            List<bool> vis1 = [
                                              false,
                                              true,
                                              true,
                                              false,
                                            ];
                                            await showCustomDialog(vis1, purchase, context);
                                            developer.log(PurchasesList().toString());
                                            setState(() {
                                              _readListData = _readList();
                                            });
                                          },
                                          child: SizedBox(
                                              width: double.infinity,
                                              height: 80,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: MouseRegion(
                                                          cursor:
                                                              SystemMouseCursors.click,
                                                          child: Text(
                                                            purchase.toString(),
                                                            style: TextStyle(
                                                              backgroundColor: Colors
                                                                  .lightGreenAccent
                                                                  .withOpacity(0.1),
                                                              decoration: bought
                                                                  ? TextDecoration
                                                                      .lineThrough
                                                                  : null,
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
                                                                  if (bought != value) {
                                                                    PurchasesList.mod(
                                                                        purchase.copyWith(
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
                                                                PurchasesList.rem(id, group);
                                                                setState(() {
                                                                  _readListData =
                                                                      _readList();
                                                                });
                                                              },
                                                              child: const Icon(Icons.remove)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                      );
                                    }),
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       width: 2,
                              //
                              //     ),
                              //     borderRadius: const BorderRadius.all(Radius.circular(20)),
                              //   ),
                              //   width: 95,
                              //   child: OverflowBox(
                              //     alignment: Alignment.topCenter,
                              //     maxHeight: double.infinity,
                              //     child: Column(
                              //       children: [
                              //         ...'SHOPPING'.split('').map((e) => FittedBox(
                              //           child: Text(e,
                              //             style: const TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               fontSize: 40,
                              //             ),
                              //           ),
                              //         )).toList(),
                              //       ],
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      );
                    }
                  }
                  return inErrorCenter('hasError', () => setState(() {
                    _readListData = _readList();
                  }));
                } else if (snap.hasError) {
                  return inErrorCenter('hasError', () => setState(() {
                    _readListData = _readList();
                  }));
                } else {
                  return inErrorCenter('No data', () => setState(() {
                    _readListData = _readList();
                  }));
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
              onPressed: () {
                PurchasesList.remAll();
                developer.log(PurchasesList().toString());
                setState(() {
                  _readListData = _readList();
                });
              },
              tooltip: 'Remove All',
              child: const Icon(Icons.remove_shopping_cart_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget inErrorCenter(String err, void Function() f,) {
    return Center(
      child: Column(children: [
        Text(err),
        ElevatedButton(
            onPressed: () => f(),
            child: const Text('Refresh'))
      ]),
    );
  }
}
