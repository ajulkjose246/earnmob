import 'package:earnmob/services/authServices.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class screenLogin extends StatefulWidget {
  const screenLogin({super.key});

  @override
  State<screenLogin> createState() => _screenLoginState();
}

// ignore: camel_case_types
class _screenLoginState extends State<screenLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Spacer(),
            Lottie.asset('assets/svg/login.json'),
            const Text(
              "Let's dive in!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(192, 0, 0, 1),
                  fontFamily: 'Kaleko'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Secure your spot in our digital universe. Log in and explore",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(0, 33, 93, 1),
                fontFamily: 'Kaleko',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  AuthService().signInWithGoogle();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/auth', (route) => false);
                },
                child: Text("Google")),
            Spacer()
          ],
        ),
      )),
    );
  }
}
