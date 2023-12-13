// ignore_for_file: file_names
import 'package:earnmob/screens/dashPages/pageHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
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
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          const SizedBox(width: 10),
          const Text(
            "Earn",
            style: TextStyle(
              fontFamily: 'Kaleko',
              fontSize: 18,
              color: Color.fromRGBO(192, 0, 0, 1),
            ),
          ),
          const Text(
            "Mob",
            style: TextStyle(
              fontFamily: 'Kaleko',
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Container(
            width: 70,
            height: 40,
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
            height: 40,
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
