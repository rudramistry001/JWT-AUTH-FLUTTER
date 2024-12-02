
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_starter/authentication/login_screen.dart';
import 'package:jwt_starter/authentication/sign_up_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({
    super.key,
  });

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                buildOnboardingPage(
                  imagePath: "assets/images/onboard1.png",
                  headtext: "Welcome to D Commercial",
                  bodytext:
                      "Enjoy viewing a large amount of products online...",
                  appIconPath: "assets/images/logo.png",
                  appName: "D Commerce",
                ),
                buildOnboardingPage(
                  imagePath: "assets/images/onboard2.png",
                  headtext: "We give you your choice",
                  bodytext:
                      "We ensure you enormous customisation so, you get what you want...",
                  appIconPath: "assets/images/logo.png",
                  appName: "D Commerce",
                ),
                buildOnboardingPage(
                  imagePath: "assets/images/onboard3.png",
                  headtext: "Get your stuff on time",
                  bodytext:
                      "We ensure you the delivery of all the packafges you order on time...",
                  appIconPath: "assets/images/logo.png",
                  appName: "D Commerce",
                ),
              ],
            ),
          ),
          // Indicators and Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => buildIndicator(index == _currentPage),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage == 2)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.sp),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                if (_currentPage == 2)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    child: const Text("Sign Up"),
                  ),
                if (_currentPage < 2)
                  Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: InkWell(
                      onTap: () {
                        _pageController.jumpToPage(2);
                      },
                      child: const Row(
                        children: [
                          Text(
                            "Skip",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.blueAccent,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_currentPage < 2)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    child: const Text("Next"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0,
      width: isActive ? 20.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  Widget buildOnboardingPage({
    required String imagePath,
    required String headtext,
    required String bodytext,
    required String appIconPath,
    required String appName,
  }) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              appIconPath,
              height: 40.0,
              width: 40.0,
            ),
            10.verticalSpace,
            Text(
              appName,
              style: TextStyle(
                fontFamily: "DancingScript",
                color: Colors.blue,
                fontSize: 38.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 240.0.sp,
            ),
            25.horizontalSpace,
            Text(
              headtext,
              style: TextStyle(
                color: Colors.blueAccent,
                fontFamily: "RobotoCondensed",
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              bodytext,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18.0.sp,
                fontWeight: FontWeight.normal,
                fontFamily: "RobotoCondensed",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
