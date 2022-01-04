import 'package:edcheckv2/internals/onboarding_content.dart';
import 'package:edcheckv2/screens/checker/checker_homepage.dart';

import 'package:edcheckv2/screens/homepage/home_page.dart';
import 'package:edcheckv2/screens/student/student_homepage.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Center(
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Image.asset(
                              contents[i].image,
                              height: 300,
                            ),
                            Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Color(0xff1d1d1d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0,
                                  letterSpacing: 1.5),
                            ),
                            SizedBox(height: 30),
                            Text(
                              contents[i].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Color(0xff1d1d1d),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                  letterSpacing: 1.5),
                            )
                          ],
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Trueno',
                      letterSpacing: 1.5),
                ),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        //change to HomePage() for home
                        // change to CheckerHomePage() for Checkers
                        // change to StudentHomePage() for Students
                        builder: (_) => StudentHomePage(),
                      ),
                    );
                  }
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                color: Color(0xff20b24d),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff20b24d),
      ),
    );
  }
}
