// add introduction_screen: ^2.1.0 in dependencies > pubspec.yaml

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: 'Welcome',
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "[Students] ",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      letterSpacing: 1.5),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "How it works?",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 21,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.5,
                      color: Color(0xff20b24d)),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/welcome_students.png',
                  width: 280,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "A+",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Marker',
                      color: Color(0xff20b24d)),
                ),
              ],
            ),
            decoration: PageDecoration(
              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              contentMargin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              titleTextStyle: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Marker',
                  color: Color(0xff1d1d1d)),
              bodyTextStyle: TextStyle(
                  fontSize: 1,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Helvetica',
                  letterSpacing: 1.5,
                  color: Color(0xff1d1d1d)),
              descriptionPadding: EdgeInsets.all(0).copyWith(bottom: 0),
              imagePadding: EdgeInsets.fromLTRB(24, 32, 24, 20),
            ),
          ),
          PageViewModel(
            title: 'Welcome',
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "[Tutors] ",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      letterSpacing: 1.5),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.info_rounded,
                  color: Color(0xff20b24d),
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "To start checking \nassignments, sign up for an account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1,
                        fontFamily: 'Helvetica',
                        color: Color(0xff1d1d1d)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Transform.rotate(
                  angle: 0,
                  child: Icon(
                    Icons.flag_rounded,
                    color: Color(0xff20b24d),
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "Join us on our mission to boost GPAs around the world!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1,
                        fontFamily: 'Helvetica',
                        color: Color(0xff1d1d1d)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "For more info, send us an email at",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1,
                        fontFamily: 'Helvetica',
                        color: Color(0xff1d1d1d)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "info@edcheck.app",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1,
                        fontFamily: 'Helvetica',
                        color: Color(0xff20b24d)),
                  ),
                ),
              ],
            ),
            // body: '[students]\nHow it work?',

            decoration: PageDecoration(
              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              contentMargin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              titleTextStyle: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Marker',
                  color: Color(0xff1d1d1d)),
              bodyTextStyle: TextStyle(
                  fontSize: 1,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Helvetica',
                  color: Color(0xff1d1d1d)),
              descriptionPadding: EdgeInsets.all(0).copyWith(bottom: 0),
              imagePadding: EdgeInsets.fromLTRB(24, 32, 24, 20),
            ),
          ),
        ],
        done: Text('Get Started',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xff3fb549))),
        onDone: () {},
        showSkipButton: false,
        showDoneButton: false,
        skip: Text('Skip', style: TextStyle(color: Colors.black)),
        onSkip: () {},
        next: Icon(Icons.arrow_forward_outlined, color: Colors.black),
        dotsDecorator: DotsDecorator(
          color: Colors.black,
          activeColor: Color(0xff27AE60),
          size: Size(10, 10),
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}
