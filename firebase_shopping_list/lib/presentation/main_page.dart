import 'dart:developer' as developer;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/domain/domain.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'widget/widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
/*https://stackoverflow.com/questions/72893730/do-not-use-buildcontexts-across-async-gaps-flutter

The problem is that after an await, every use of the BuildContext will show this
warning. This warning happens because using a BuildContext after an await could
happen after the widget is disposed of. This way, the context wouldn't exist
anymore and the app could even crash because of this. Check out the official
lint documentation(https://api.flutter.dev/flutter/widgets/State/mounted.html):
Storing BuildContext for later usage can easily lead to difficult-to-diagnose
crashes. Asynchronous gaps are implicitly storing BuildContext and are some of
the easiest to overlook when writing code.
The easy solution, from the official docs, is the need to check for
State.mounted (https://api.flutter.dev/flutter/widgets/State/mounted.html).
The code would look something like this on every place the warning shows up:
      ...
      } else {
        if (mounted) Utils.flushBarErrorMessage("No Internet", context);
      }
      ...
*/

    if (mounted) await showCustomDialog(vis, data, context, '');
    developer.log(PurchasesList().toString());
  }

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
              const Text('Hide Buy'),
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
              PurchasesList.purchases
                  .where('bought', isEqualTo: false)
                  .orderBy('price', descending: sortFilter)
                  .snapshots()
                  .map((e) {
                return e.docs.map((e) {
                  return (e.id, e.data());
                }).toList();
              })
              :PurchasesList.purchases
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
                                    return CustomCard(id: id, purchase: purchase);
                                  }),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                   developer.log('${snap.connectionState}');
                   developer.log('${snap.data}');
                   return inErrorCenter('hasError', () {
                     setState(() {
                     });
                   });
                } else if (snap.hasError) {
                  developer.log('${snap.connectionState}');
                  developer.log('${snap.data}');
                  return inErrorCenter('hasError', () {
                    setState(() {
                    });
                  });
                } else {
                  developer.log('${snap.connectionState}');
                  developer.log('${snap.data}');
                  return inErrorCenter('No data', () {
                    setState(() {
                    });
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
