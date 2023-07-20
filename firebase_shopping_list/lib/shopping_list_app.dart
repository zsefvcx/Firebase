
import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_shopping_list/domain/bloc/bloc_factory.dart';
import 'package:firebase_shopping_list/presentation/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';

import 'domain/bloc/main_bloc.dart';

class ShoppingListApp extends StatefulWidget {
  const ShoppingListApp({super.key});

  @override
  State<ShoppingListApp> createState() => _ShoppingListAppState();
}

class _ShoppingListAppState extends State<ShoppingListApp> {

  final String clientId = '1675fba8e1af87778abb';
  final String clientSecret = '08e782d29b72ea3996839e9219d6b5b49bd0c43e';

  late final MainBloc _mainBloc;

  bool buyFilter = true;
  bool sortFilter = true;

  @override
  void initState() {
    super.initState();
    _mainBloc = BlocFactory.instance.get<MainBloc>();
    initBloc();
  }

  void initBloc() {//Ожидаем пока прогрузиться основной поток связаный с основной базой
    _mainBloc.addEvent(MainBlocEvent.init(buyFilter: buyFilter, sortFilter: sortFilter));
  }

  @override
  void dispose() {
    super.dispose();
    _mainBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MainBloc>(
            create: (_) =>
            _mainBloc),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Firebase Shopping List',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Center(
                        child: ElevatedButton(onPressed: singIn,
                          child: const Text('login with Google'),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: ElevatedButton(onPressed: ()=> singInGitHub(context),
                          child: const Text('login with GitHub'),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Center(
                        child: ElevatedButton(onPressed: singInAnonymously,
                          child: const Text('login with Anonymously'),
                        ),
                      ),
                    ),
                  ],
                );
              } else {

                return const MainPage(title: 'Firebase Shopping List');
              }

            },
          )
      ),
    );
  }

  Future<void> singInAnonymously() async {
    try {
      //final userCredential =
      await FirebaseAuth.instance.signInAnonymously();
      developer.log("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          developer.log("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          developer.log("Unknown error.");
      }
    }

  }

  Future<UserCredential> singInGitHub(BuildContext context) async {
    if(kIsWeb){
      // Create a new provider
      GithubAuthProvider githubProvider = GithubAuthProvider();
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(githubProvider);
      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(githubProvider);
    } else {

      try {
        // Create a GitHubSignIn instance
        final GitHubSignIn gitHubSignIn = GitHubSignIn(
            clientId: clientId,
            clientSecret: clientSecret,
            redirectUrl: 'https://fir-shopping-list-d4dad.firebaseapp.com/__/auth/handler');

        // Trigger the sign-in flow
        final result = await gitHubSignIn.signIn(context);

        // Create a credential from the access token
        final githubAuthCredential = GithubAuthProvider.credential(result.token!);

        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(
            githubAuthCredential);
      } catch(e, s){
        developer.log('131:$s $e');
        throw('$s $e');
      }
    }
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
    developer.log('${googleUser?.email}');
    if(googleUser != null){
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    throw('Error Authentication');
  }

  Future<UserCredential?> singInWithGoogleWeb() async {

    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@gmail.com'});

    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

  }
}