import 'dart:developer' as developer;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/domain/domain.dart';
import 'package:firebase_shopping_list/widget/widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../core/my_flutter_app_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storage = FirebaseStorage.instance;


  Future<void> _add() async {
    final int id = await PurchasesList.length;
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
    await showCustomDialog(vis, data, context, '');
    developer.log(PurchasesList().toString());
  }

  // Future<bool> _readList() async {
  //   try {
  //     await Future.delayed(const Duration(milliseconds: 5));
  //     return true;
  //   } catch (e) {
  //     developer.log(e.toString());
  //     return false;
  //   }
  // }

  late Future<bool> _readListData;

  bool buyFilter = true;
  bool sortFilter = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: (){
                setState(() {
                  sortFilter = !sortFilter;
                });
              },
              tooltip: 'Sort by price',
              child: sortFilter?const Icon(MyFlutterApp.sort_amount_up):const Icon(MyFlutterApp.sort_amount_down),
            ),
          ),
          Row(
            children: [
              const Text('Show not Buy'),
              Switch(
                value: buyFilter,
                activeColor: Colors.red,
                onChanged: (bool value) async {
                  if (buyFilter != value) {
                    setState(() {
                      buyFilter = value;
                    });
                  }
                },
              ),
            ],
          ),
        ],
        title: FutureBuilder<String>(
          future: storage.ref('img.jpg').getDownloadURL(),
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done?
          CachedNetworkImage(
            imageUrl: snapshot.data!,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fitHeight,
          )
              : const Center(child: CircularProgressIndicator())
          ,),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<List<(String, Purchase)>>(
              stream:
              buyFilter?
              PurchasesList.purchases0
                  //.orderBy('price', descending: sortFilter)
                  .where('bought', isEqualTo: false)
                  .snapshots()
                  .map((e) {
                return e.docs.map((e) {
                  return (e.id, e.data());
                }).toList();
              })
              :PurchasesList.purchases0
                  .orderBy('price', descending: sortFilter)
                  .snapshots()
                  .map((e) {
                    return e.docs.map((e) {
                      return (e.id, e.data());
                    }).toList();
                  }),
              builder: (_, snap) {
                //final width = MediaQuery.of(context).size.width;
                //print('FutureBuilder');
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snap.connectionState  == ConnectionState.active) {
                  if (snap.hasData) {
                    bool status = true;//snap.data ?? false;
                    List<(String, Purchase)> purchasesList = snap.data??[];
                    if (status) {
                      int length = purchasesList.length;
                      return ScrollConfiguration(
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
                                  itemBuilder: (_, index) {
                                    String id; Purchase purchase;
                                    (id, purchase) = purchasesList[index];
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
                                          await showCustomDialog(vis1, purchase, context, id);
                                          developer.log(PurchasesList().toString());
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
                                                              onChanged: (bool value) async {
                                                                if (bought != value) {
                                                                  await PurchasesList.mod(
                                                                      id,
                                                                      purchase.copyWith(
                                                                        bought: value,
                                                                      ));
                                                                  bought = value;
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        ElevatedButton(
                                                            onPressed: () async {
                                                              await PurchasesList.rem(id, group);
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
                      );
                    }
                  }
                  return inErrorCenter('hasError', () {
                    print(snap.connectionState);
                    print(snap.data);
                  });
                } else if (snap.hasError) {
                  print(snap.connectionState);
                  print(snap.data);
                  return inErrorCenter('hasError', () {
                  });
                } else {
                  print(snap.connectionState);
                  print(snap.data);
                  return inErrorCenter('No data', () {
                  });
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
              },
              tooltip: 'Remove All',
              child: const Icon(Icons.remove_shopping_cart_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: singOut,
              tooltip: 'Sing Out',
              child: const Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> singOut()  async => await FirebaseAuth.instance.signOut();

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
