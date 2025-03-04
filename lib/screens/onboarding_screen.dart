import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mytravel/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEF7FF),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: IntroductionScreen(
            pages: [
              PageViewModel(
                title: "Welcome",
                body:
                    "Your ultimate travel companion, helping you discover new destinations, plan trips, and create unforgettable memories.",
                image: buildImage('assets/images/screen-1.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: "About App",
                body:
                    "Discover amazing destinations, create personalized itineraries, and connect with fellow travelers all in one intuitive app.",
                image: buildImage('assets/images/screen-2.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: "Get Started",
                body: "Let's sign up and start using the app now.",
                image: buildImage('assets/images/screen-3.png'),
                decoration: getPageDecoration(),
                footer: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => goToHome(context),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                      "Start Now",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
            done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
            onDone: () => goToHome(context),
            showSkipButton: true,
            skip: Text("Skip"),
            next: Icon(Icons.arrow_forward),
            dotsDecorator: getDotsDecorator(),
          ),
        ),
      ),
    );
  }

  void goToHome(BuildContext context) async {
    final prefer = await SharedPreferences.getInstance();
    await prefer.setBool("ON_BOARDING", false);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SignInScreen()),
    );
  }

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 250));

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
        imagePadding: EdgeInsets.all(20),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      );
}
