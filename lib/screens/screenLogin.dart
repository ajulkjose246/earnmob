import 'package:flutter/material.dart';

class screenLogin extends StatefulWidget {
  const screenLogin({super.key});

  @override
  State<screenLogin> createState() => _screenLoginState();
}

class _screenLoginState extends State<screenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Login Page")),
    );
  }
}
