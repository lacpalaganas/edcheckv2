// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'dart:ffi';
import 'dart:io';

import 'package:edcheckv2/screens/checker/checker_change_password.dart';
import 'package:edcheckv2/screens/checker/checker_edit_information.dart';
import 'package:edcheckv2/screens/checker/checker_feedback.dart';
import 'package:edcheckv2/screens/student/student_change_password.dart';
import 'package:edcheckv2/screens/student/student_edit_information.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StudentProfile extends StatefulWidget {
  // final Function(String) callback;
  StudentProfile();

  @override
  State<StudentProfile> createState() => StudentProfileState();
}

class StudentProfileState extends State<StudentProfile> {
  bool rememberMe = false;
  final nameControler = TextEditingController();
  final emailControler = TextEditingController();
  final aboutControler = TextEditingController();

  final accountNameControler = TextEditingController();
  final accountNumberControler = TextEditingController();
  final bankNameControler = TextEditingController();
  final routingNumberControler = TextEditingController();

  final feedbackControler = TextEditingController();

  final List<Widget> imageSource = <Widget>[];
  int sourceIndex = 0;

  @override
  void initState() {
    super.initState();
    sourceIndex = 0;
    imageSource.insert(0, networkImage());
  }

  Widget networkImage() {
    return CircleAvatar(
      backgroundColor: Colors.green,
      backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1562246229-37b3aca47e18?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    );
  }

  Widget localImage() {
    return CircleAvatar(
      backgroundImage: FileImage(_image),
      backgroundColor: Colors.green,
    );
  }

  void onUpdatePress() {}

  ImagePicker picker = ImagePicker();
  var _image;

  Future<void> onCameraPress() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    setState(() {
      _image = File(image!.path);

      if (imageSource.length == 3) {
        imageSource.removeAt(2);
        imageSource.insert(1, localImage());
        sourceIndex = 1;
      } else {
        imageSource.insert(1, localImage());
        sourceIndex = 1;
      }
    });
  }

  Future<void> onGalleryPress() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    setState(() {
      _image = File(image!.path);
      if (imageSource.length == 3) {
        imageSource.removeAt(2);
        imageSource.insert(1, localImage());
        sourceIndex = 1;
      } else {
        imageSource.insert(1, localImage());
        sourceIndex = 1;
      }
    });
  }

  Future<void> onLogoutPress() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          titleTextStyle: TextStyle(
              color: Color(0xff1d1d1d),
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
              letterSpacing: 2.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Logout'),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff1d1d1d),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      textStyle: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                      )),
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff20b24d),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      textStyle: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                      )),
                  onPressed: () {},
                  child: const Text('Logout'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }

  void onUploadPress() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Container(
            width: double.infinity,
            height: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5),
                  child: SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        label: Text('Camera'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff20b24d),
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Trueno',
                              letterSpacing: 1.5),
                        ),
                        onPressed: onCameraPress),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        label: Text('Gallery'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff20b24d),
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Trueno',
                              letterSpacing: 1.5),
                        ),
                        onPressed: onGalleryPress),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Color(0xffe9f8ee),
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        imageSource.elementAt(sourceIndex),
                        Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              onPressed: onUploadPress,
                              elevation: 2.0,
                              fillColor: Color(0xFFF5F6F9),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.green,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Norman Dobss',
                  style: TextStyle(
                      color: Color(0xff1d1d1d),
                      fontFamily: 'Helvetica',
                      fontWeight: FontWeight.normal,
                      fontSize: 24.0,
                      letterSpacing: 2),
                ),
                SizedBox(height: 2.0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: " School: ",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            letterSpacing: 1.5),
                      ),
                      TextSpan(
                        text: " Los Angeles State College Univeristy ",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.0),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.check_circle_outline_outlined,
                          size: 19,
                          color: Colors.green,
                        ),
                      ),
                      TextSpan(
                        text: " 360 Added ",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Card(
                  elevation: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Personal Information",
                            style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ),
                    leading: Icon(Icons.featured_play_list_outlined),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentEditInfo(),
                          ));
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                Card(
                  elevation: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Change Password",
                            style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ),
                    leading: Icon(Icons.lock_open_rounded),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentChangePassword(),
                          ));
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                Card(
                  elevation: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Feedback",
                            style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ),
                    leading: Icon(Icons.info_outline_rounded),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckerFeedback(),
                          ));
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                Card(
                  elevation: 2,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Logout",
                            style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.5),
                          ),
                        ],
                      ),
                    ),
                    leading: Icon(Icons.logout_rounded),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: onLogoutPress,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
