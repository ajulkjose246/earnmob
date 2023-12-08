import 'package:earnmob/screens/screenHome.dart';
import 'package:earnmob/screens/screenLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const earnmob());
}

// ignore: camel_case_types
class earnmob extends StatelessWidget {
  const earnmob({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const screenHome(),
        '/login': (context) => const screenLogin(),
      },
      initialRoute: '/',
    );
  }
}
