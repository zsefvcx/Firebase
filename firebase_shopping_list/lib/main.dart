
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_shopping_list/domain/domain.dart';
import 'package:firebase_shopping_list/widget/widget.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  PurchasesList.init();

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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return ElevatedButton(onPressed: singIn,
                child: const Text('login');
            );
          } else {
            return const MyHomePage(title: 'Firebase Shopping List');
          }

        },
      )
    );
  }

  void singIn(){
    if(kIsWeb){
      singInWithGoogleWeb();
    } else {
      singInWithGoogle();
    }

  }

  Future<UserCredential?> singInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print(googleUser?.email);
    if(googleUser != null){
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

  }

  Future<UserCredential?> singInWithGoogleWeb() async {

    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope(scope);
    googleProvider.setCustomParameters(customOAuthParameters);

    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

  }

}