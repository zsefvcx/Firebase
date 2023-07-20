import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shopping_list/core/core.dart';


//Проверка на наличие записи
/*
isdata(date){
//создаем пустой список
var dates=[];
//инициализируем нашу базу данных
var db = FirebaseFirestore.instance;
await db.collection("users").get().then((event) {
//получаем данные date и заносим их в список
    for (var doc in event.docs) {
      dates.add(doc.get('date'));
//проверяем на наличие
    if (date.contains(date)==true){
     print('занято');
      }
    }
  }
}
*/


class PurchasesList {
  static late final CollectionReference<Purchase> purchases;

  static void init(){
    purchases = FirebaseFirestore.instance.collection('Purchase').withConverter<Purchase>(
      fromFirestore: (snapshot, _) => Purchase.fromJson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
  }

  static Future<int> get length async {
    var data = await purchases.get()
        .whenComplete(() => developer.log('Get length complete'))
        .onError((error, stackTrace) {
          developer.log('$stackTrace\n$error');
          throw('$stackTrace\n$error');
        });
    return data.docs.length;
  }

  static Future<Purchase?> get(String id) async {
    var elem = await purchases.doc(id).get().whenComplete(() => developer.log('Get Data with id:$id'))
        .onError((error, stackTrace) {
      developer.log('$stackTrace\n$error');
      throw('$stackTrace\n$error');
    });
    return elem.data();
  }

  static Future<void> add(Purchase data) async {
    await purchases.add(data)
        .whenComplete(() => developer.log('add data:$data'))
        .onError((error, stackTrace) {
          developer.log('$stackTrace\n$error');
          throw('$stackTrace\n$error');
        });
  }

  static Future<void> remAll() async {
    var data = await purchases.get();
    for(var elem in data.docs){
      await purchases.doc(elem.id).delete()
          .whenComplete(() => developer.log('delete data with id:${elem.id}'))
          .onError((error, stackTrace) => developer.log('$stackTrace\n$error'));
    }
  }

  static Future<void> rem(String id, bool grp) async {
    await purchases.doc(id).delete()
        .whenComplete(() => developer.log('delete data with id:$id'))
        .onError((error, stackTrace) => developer.log('$stackTrace\n$error'));
  }

  static Future<void> mod(String id, Purchase data) async {
    await purchases.doc(id).set(data)
        .whenComplete(() => developer.log('set data:$data with id:$id'))
        .onError((error, stackTrace) => developer.log('$stackTrace\n$error'));
  }

}