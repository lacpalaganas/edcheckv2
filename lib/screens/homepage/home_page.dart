import 'package:edcheckv2/screens/homepage/checker_lists.dart';
import 'package:edcheckv2/screens/homepage/login_form.dart';
import 'package:edcheckv2/screens/homepage/onboarding_page.dart';
import 'package:edcheckv2/screens/homepage/welcome.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Welcome(),
    CheckerList(),
    LoginForm(),
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
            toolbarHeight: 100,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/edcheckLogo.png',
                  fit: BoxFit.cover,
                  height: 70,
                ),
              ],
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
                    'Login',
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
