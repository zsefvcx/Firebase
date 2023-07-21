import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/data/data.dart';

class ShoppingListRemoteDataSourceImpl extends ShoppingListRemoteDataSource{

  late final CollectionReference<Purchase> purchases;

  List<PurchasesListModel> purchasesList = [];


  @override
  void init(){
    purchases = FirebaseFirestore.instance.collection('Purchase').withConverter<Purchase>(
      fromFirestore: (snapshot, _) => Purchase.fromJson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
  }

  @override
  Future<int> get length async {
    var data = await purchases.count().get()
        .whenComplete(() => developer.log('Get length complete'))
        .onError((error, stackTrace) {
      developer.log('$stackTrace\n$error');
      throw('$stackTrace\n$error');
    });
    return data.count;
  }

  @override
  Future<Purchase?> get(String id) async {
    var elem = await purchases.doc(id).get().whenComplete(() => developer.log('Get Data with id:$id'))
        .onError((error, stackTrace) {
      developer.log('$stackTrace\n$error');
      throw('$stackTrace\n$error');
    });
    return elem.data();
  }

  @override
  Future<void> add(Purchase data) async {
    await purchases.add(data)
        .whenComplete(() => developer.log('add data:$data'))
        .onError((error, stackTrace) {
      developer.log('$stackTrace\n$error');
      throw('$stackTrace\n$error');
    });
  }

  @override
  Future<void> remAll() async {
    var data = await purchases.get();
    for(var elem in data.docs){
      await purchases.doc(elem.id).delete()
          .whenComplete(() => developer.log('delete data with id:${elem.id}'))
          .onError((error, stackTrace) => developer.log('$stackTrace\n$error'));
    }
  }

  @override
  Future<void> rem(String id, bool grp) async {
    await purchases.doc(id).delete()
        .whenComplete(() => developer.log('delete data with id:$id'))
        .onError((error, stackTrace) => developer.log('$stackTrace\n$error'));
  }

  @override
  Future<void> mod(String id, Purchase data) async {
    await purchases.doc(id).set(data)
        .whenComplete(() => developer.log('set data:$data with id:$id'))
        .onError((error, stackTrace) => developer.log('$stackTrace\n$error'));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  bool isBusy() {
    // TODO: implement isBusy
    return false;
    //throw UnimplementedError();
  }

  @override
  Stream<List<PurchasesListModel>> getAll({required bool sortFilter, required bool buyFilter}) {
    if (buyFilter){
      return purchases
          .where('bought', isEqualTo: false)
          .orderBy('price', descending: sortFilter)
          .snapshots()
          .map((e) {
        return e.docs.map((e) {
          return PurchasesListModel(id: e.id, purchase: e.data());
        }).toList();
      });
    } else {
      return purchases
          .orderBy('price', descending: sortFilter)
          .snapshots()
          .map((e) {
        return e.docs.map((e) {
          return PurchasesListModel(id: e.id, purchase: e.data());
        }).toList();
      });
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}