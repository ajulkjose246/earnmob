import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class screenHome extends StatefulWidget {
  const screenHome({super.key});

  @override
  State<screenHome> createState() => _screenHomeState();
}

class AppConstants {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double systemFS = 0;
  static double defaultFontSize = 0;
}

// ignore: camel_case_types
class _screenHomeState extends State<screenHome> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppConstants.screenWidth = MediaQuery.of(context).size.width;
    AppConstants.screenHeight = MediaQuery.of(context).size.height;
    AppConstants.systemFS = MediaQuery.textScaleFactorOf(context);
    // ignore: unused_local_variable
    if (AppConstants.screenWidth < 600) {
      AppConstants.defaultFontSize = 18 / AppConstants.systemFS;
    } else if (AppConstants.screenWidth >= 600 &&
        AppConstants.screenWidth < 1200) {
      AppConstants.defaultFontSize = 20;
    } else {
      AppConstants.defaultFontSize = 22;
    }
    return Scaffold(
        backgroundColor: const Color.fromRGBO(192, 0, 0, 1),
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppConstants.screenHeight / 2 * 1.5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, top: 8, right: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  ...List.generate(
                                    demo_data.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: DotIndicator(
                                        isActive: index == _pageIndex,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "Earn",
                                        style: TextStyle(
                                          fontFamily: 'Kaleko',
                                          fontSize:
                                              AppConstants.defaultFontSize,
                                          color: Color.fromRGBO(192, 0, 0, 1),
                                        ),
                                      ),
                                      Text(
                                        "Mob",
                                        style: TextStyle(
                                          fontFamily: 'Kaleko',
                                          fontSize:
                                              AppConstants.defaultFontSize,
                                          color: Color.fromRGBO(0, 33, 93, 1),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: PageView.builder(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _pageIndex = index;
                                  });
                                },
                                itemCount: demo_data.length,
                                itemBuilder: (context, index) => OnBoardContent(
                                  image: demo_data[index].image,
                                  title: demo_data[index].title,
                                  description: demo_data[index].description,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Achieve beyond the imagination!",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kaleko',
                              fontSize: AppConstants.defaultFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: (AppConstants.screenHeight / 2) +
                      (AppConstants.screenHeight / 4) -
                      30,
                  right: (AppConstants.screenWidth - 75).toInt() / 2,
                  left: (AppConstants.screenWidth - 75).toInt() / 2,
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageIndex != demo_data.length - 1
                            ? _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              )
                            : Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(120, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        side: const BorderSide(
                            color: Colors.white, // Set the desired border color
                            width: 3),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          size: 30,
                          color: Colors.white,
                          _pageIndex == demo_data.length - 1
                              ? Icons.exit_to_app
                              : Icons.navigate_next,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 15 : 8,
      height: 8,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard(
      {required this.image, required this.title, required this.description});
}

// ignore: non_constant_identifier_names
final List<OnBoard> demo_data = [
  OnBoard(
      image: 'assets/svg/premotion.json',
      title: 'Cost-effective promotion',
      description:
          'Kickstart with cost-effective and no-cost promotionstrategy to achieve maximum response rates, ensuringefficiency in your promotional efforts.'),
  OnBoard(
      image: 'assets/svg/freeanytime.json',
      title: 'Adaptable time frame',
      description:
          'There are no time constraints or specific hours required.You can work at your convenience during your free time,and there are no set targets to meet.'),
  OnBoard(
      image: 'assets/svg/compaign_dot.json',
      title: 'Boundless earning',
      description:
          'Earning opportunities are boundless, which allows you togenerate income through engaging in various campaignsand tasks based on your location and preferences.'),
  OnBoard(
      image: 'assets/svg/referandearn.json',
      title: 'Limitless referral bonus',
      description:
          'Earn 100 Gems per successful referral who joins, andadditionally, receive 3.5% of earnings from referredmembers and 1.5% from their referrals.'),
  OnBoard(
      image: 'assets/svg/withdrow.json',
      title: 'Target-less withdrawal',
      description:
          'Experience hassle-free redemptions with our targetlesswithdrawal policy. Enjoy the freedom to redeem yourrewards without any minimum requirements.'),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Lottie.asset(image,
              height: AppConstants.screenHeight / 3,
              width: AppConstants.screenHeight / 3),
          Text(
            title,
            style: TextStyle(
                fontSize: AppConstants.defaultFontSize + 3,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(192, 0, 0, 1),
                fontFamily: 'Kaleko'),
          ),
          SizedBox(
            height: AppConstants.screenHeight * 0.015,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppConstants.defaultFontSize - 2,
              color: Color.fromRGBO(0, 33, 93, 1),
              fontFamily: 'Kaleko',
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
