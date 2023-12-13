import 'package:earnmob/screens/screenDashBoard.dart';
import 'package:earnmob/screens/screenHome.dart';
import 'package:earnmob/screens/screenLogin.dart';
import 'package:earnmob/services/authPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

  runApp(EarnMob(
    isFirstLaunch: isFirstLaunch,
  ));
}

class EarnMob extends StatelessWidget {
  final bool isFirstLaunch;

  const EarnMob({Key? key, required this.isFirstLaunch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const screenHome(),
        '/login': (context) => const screenLogin(),
        '/auth': (context) => const AuthPage(),
        '/home': (context) => const ScreenDashboard(),
      },
      initialRoute: '/auth',
    );
  }
}
