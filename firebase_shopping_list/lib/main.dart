
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_shopping_list/shopping_list_app.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'domain/bloc/bloc_factory.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //firebase --version
  //firebase init
  //firebase init emulators
  //npm install -g firebase-tools
  //firebase emulators:start
  //http://127.0.0.1:4000/
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  BlocFactory.instance.initialize();

  runApp(const ShoppingListApp());
}