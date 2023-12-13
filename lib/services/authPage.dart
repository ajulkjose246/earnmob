import 'package:earnmob/screens/screenDashBoard.dart';
import 'package:earnmob/screens/screenLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is loged in
          if (snapshot.hasData) {
            print("login");
            return const screenDashBoard();
          }
          //user is not logged in
          else {
            print("Not login");
            return const screenLogin();
          }
        },
      ),
    );
  }
}
