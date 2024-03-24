import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workwell/mainmenu.dart';
import 'package:workwell/pages/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user is log in
          if(snapshot.hasData){
            return const MainMenu();
          } else { //user is not log in
            return const LoginPage();
          }
        },
      ),
    );
  }
}