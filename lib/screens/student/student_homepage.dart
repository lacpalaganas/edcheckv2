import 'package:edcheckv2/screens/checker/checker_assignments.dart';
import 'package:edcheckv2/screens/checker/checker_profile.dart';
import 'package:edcheckv2/screens/checker/checker_unchecked.dart';
import 'package:edcheckv2/screens/homepage/checker_lists.dart';
import 'package:edcheckv2/screens/homepage/login_form.dart';
import 'package:edcheckv2/screens/homepage/onboarding_page.dart';
import 'package:edcheckv2/screens/homepage/welcome.dart';
import 'package:edcheckv2/screens/student/student_assignments.dart';
import 'package:edcheckv2/screens/student/student_dashboard.dart';
import 'package:edcheckv2/screens/student/student_profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    StudentDashboard(),
    StudentAssignments(),
    CheckerList(),
    StudentProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 30,
            elevation: 0,
            actions: [
              // Navigate to the Search Screen
              IconButton(onPressed: () {}, icon: Icon(Icons.search))
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
            backgroundColor: Colors.white),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 3),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    title: Text(
                      'Home',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          letterSpacing: 2.0),
                    ),
                    backgroundColor: Colors.green),
                BottomNavigationBarItem(
                  icon: Icon(Icons.ballot_rounded),
                  title: Text(
                    'Assignments',
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 2.0),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.gpp_good_rounded),
                  title: Text(
                    'Checkers',
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 2.0),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 2.0),
                  ),
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xff20b24d),
              iconSize: 30,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
