// ignore_for_file: file_names
import 'package:earnmob/screens/dashPages/pageCampaigns.dart';
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

class AppConstants {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double systemFS = 0;
  static double defaultFontSize = 0;
  static double bottomAppBarverti = 0;
}

final user = FirebaseAuth.instance.currentUser;

void userLogout() {
  FirebaseAuth.instance.signOut();
}

int _selectedIndex = 0;
PageController _pageController = PageController();

const List<Widget> homePages = <Widget>[
  pageCampaigns(),
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

    AppConstants.screenWidth = MediaQuery.of(context).size.width;
    AppConstants.screenHeight = MediaQuery.of(context).size.height;
    // ignore: deprecated_member_use
    AppConstants.systemFS = MediaQuery.textScaleFactorOf(context);
    // ignore: unused_local_variable
    if (AppConstants.screenWidth < 600) {
      AppConstants.defaultFontSize = 18 / AppConstants.systemFS;
      print(AppConstants.screenHeight);
    } else if (AppConstants.screenWidth >= 600 &&
        AppConstants.screenWidth < 1200) {
      AppConstants.defaultFontSize = 20 / AppConstants.systemFS;
    } else {
      AppConstants.defaultFontSize = 22 / AppConstants.systemFS;
    }

    return Scaffold(
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
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: const CircularNotchedRectangle(),
        color: const Color.fromRGBO(2, 42, 114, 1),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: (1800 / AppConstants.screenWidth) + 1),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
                margin: EdgeInsets.only(right: 50),
              ),
              GButton(
                icon: UniconsLine.fire,
                text: 'Boosters',
                margin: EdgeInsets.only(left: 50),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB press
        },
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(2, 42, 114, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(2, 42, 114, 1),
        // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 5),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            const SizedBox(width: 10),
            StrokeText(
              text: 'Earn',
              textStyle: TextStyle(
                fontFamily: 'Kaleko',
                fontSize: AppConstants.defaultFontSize,
                color: const Color.fromRGBO(192, 0, 0, 1), // Set the text color
              ),
              strokeWidth: 2.0,
              strokeColor: Colors.white, // Set the border color
            ),
            StrokeText(
              text: 'Mob',
              textStyle: TextStyle(
                fontFamily: 'Kaleko',
                fontSize: AppConstants.defaultFontSize,
                color: const Color.fromRGBO(0, 33, 93, 1), // Set the text color
              ),
              strokeWidth: 2.0,
              strokeColor: Colors.white, // Set the border color
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 65,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.wallet,
                            size: AppConstants.defaultFontSize - 2.5,
                          ),
                          const Spacer(),
                          Text(
                            "99999",
                            style: TextStyle(
                              fontFamily: 'Kaleko',
                              fontSize: AppConstants.defaultFontSize - 6,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 65,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.diamond,
                            size: AppConstants.defaultFontSize - 2.5,
                          ),
                          const Spacer(),
                          Text(
                            "99999",
                            style: TextStyle(
                              fontFamily: 'Kaleko',
                              fontSize: AppConstants.defaultFontSize - 6,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                        width: 65,
                        height: 17,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(192, 0, 0, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const Spacer(),
                            Text(
                              "Basic",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Kaleko',
                                  fontSize: AppConstants.defaultFontSize - 7),
                            ),
                            const Spacer()
                          ],
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
