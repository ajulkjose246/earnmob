import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class screenDashBoard extends StatefulWidget {
  const screenDashBoard({super.key});

  @override
  State<screenDashBoard> createState() => _screenDashBoardState();
}

final user = FirebaseAuth.instance.currentUser;

void userLogout() {
  FirebaseAuth.instance.signOut();
}

// ignore: camel_case_types
class _screenDashBoardState extends State<screenDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () {
              userLogout();
            },
            icon: const Icon(Icons.exit_to_app))
      ]),
      body: SafeArea(
        child: Text("DashBoard ${user?.email ?? 'Unknown'}"),
      ),
    );
  }
}
