import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class screenHome extends StatefulWidget {
  const screenHome({Key? key}) : super(key: key);

  @override
  State<screenHome> createState() => _screenHomeState();
}

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
    return Scaffold(
        backgroundColor: Color.fromRGBO(192, 0, 0, 1),
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 700,
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
                                  const Row(
                                    children: [
                                      Text(
                                        "Earn",
                                        style: TextStyle(
                                          fontFamily: 'Kaleko',
                                          fontSize: 20,
                                          color: Color.fromRGBO(192, 0, 0, 1),
                                        ),
                                      ),
                                      Text(
                                        "Mob",
                                        style: TextStyle(
                                          fontFamily: 'Kaleko',
                                          fontSize: 20,
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
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Achieve beyond the imagination!",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kaleko',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 200,
                  right: 185,
                  left: 185,
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
                      child: Icon(_pageIndex == demo_data.length - 1
                          ? Icons.exit_to_app
                          : Icons.navigate_next),
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
          const Spacer(),
          Lottie.asset(image, height: 400, width: 400),
          Text(
            title,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(192, 0, 0, 1),
                fontFamily: 'Kaleko'),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
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
