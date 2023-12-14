// ignore_for_file: file_names
import 'package:earnmob/screens/dashPages/pageHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:unicons/unicons.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenDashboardState createState() => _ScreenDashboardState();
}

final user = FirebaseAuth.instance.currentUser;

void userLogout() {
  FirebaseAuth.instance.signOut();
}

int _selectedIndex = 0;
PageController _pageController = PageController();

const List<Widget> homePages = <Widget>[
  pageHome(),
  Center(child: Text('Likess')),
  Center(child: Text('Search')),
  Center(child: Text('Profile')),
];

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(2, 42, 114, 1),
    ));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(2, 42, 114, 1),
      body: SafeArea(
          child: Column(
        children: [
          const mainDash(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: homePages,
            ),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          color: const Color.fromRGBO(2, 42, 114, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: Icons.campaign_outlined,
                  text: 'Campaigns',
                ),
                GButton(
                  icon: UniconsLine.clipboard,
                  text: 'Activities',
                ),
                GButton(
                  icon: UniconsLine.fire,
                  text: 'Boosters',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class mainDash extends StatelessWidget {
  const mainDash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 5),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          const SizedBox(width: 10),
          const StrokeText(
            text: 'Earn',
            textStyle: TextStyle(
              fontFamily: 'Kaleko',
              fontSize: 22,
              color: Color.fromRGBO(192, 0, 0, 1), // Set the text color
            ),
            strokeWidth: 2.0,
            strokeColor: Colors.white, // Set the border color
          ),
          const StrokeText(
            text: 'Mob',
            textStyle: TextStyle(
              fontFamily: 'Kaleko',
              fontSize: 22,
              color: Color.fromRGBO(0, 33, 93, 1), // Set the text color
            ),
            strokeWidth: 2.0,
            strokeColor: Colors.white, // Set the border color
          ),
          const Spacer(),
          Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: const Row(
              children: [
                Spacer(),
                Icon(Icons.wallet),
                Spacer(),
                Text(
                  "500",
                  style: TextStyle(
                    fontFamily: 'Kaleko',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: const Row(
              children: [
                Spacer(),
                Icon(Icons.diamond),
                Spacer(),
                Text(
                  "500",
                  style: TextStyle(
                    fontFamily: 'Kaleko',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
