import 'dart:convert';

import 'package:edcheckv2/internals/school.dart';
import 'package:edcheckv2/internals/subject.dart';
import 'package:edcheckv2/terms/policy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class StudentEditInfo extends StatefulWidget {
  const StudentEditInfo({Key? key}) : super(key: key);

  @override
  _StudentEditInfoState createState() => _StudentEditInfoState();
}

class _StudentEditInfoState extends State<StudentEditInfo> {
  bool agreement = false;
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final schoolController = TextEditingController();
  final subjectController = TextEditingController();
  final bioController = TextEditingController();

  //added var
  bool isObscure = true;
  bool isVisibleSchoolField = true;
  bool isVisibleSubjectField = false;
  bool isVisibleBioField = false;

  final _formKey = GlobalKey<FormState>();

  String userTypeSelected = "1";

  List<DropdownMenuItem<String>> get userDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Student"), value: "1"),
      DropdownMenuItem(child: Text("Tutor"), value: "2"),
    ];
    return menuItems;
  }

  final String _APIKEY = "e1eb74bc5148970392bd89e2d0822f29e27fc9c12";

  String userType = "2";

  void onUpdatePress() async {
    Navigator.pop(context);
    // if (_formKey.currentState!.validate()) {
    //   setState(() {});

    //   String name = nameControler.text.trim();
    //   String mobile = phoneNumberControler.text.trim();
    //   String password = passwordControler.text.trim();

    //   String status = "0";
    //   String freeAssignment = "0";
    //   String gradeLevel = "0";
    //   String userType = "2";

    //   var email = emailControler.text.trim();

    //   print("Name inputted: " + nameControler.text);
    //   print("Mobile inputted: " + phoneNumberControler.text);
    //   print("Email inputted: " + emailControler.text);
    //   print("Pass inputted: " + password);

    //   RequestHandler request = RequestHandler(_APIKEY);
    //   var data = await request
    //       .getServerIds("e1eb74bc5148970392bd89e2d0822f29e27fc9c14");

    //   var jsonData = jsonDecode(data);
    //   List<Account> accounts = [];
    //   for (Map accs in jsonData) {
    //     int iterate = 0;
    //     accounts.insert(iterate, Account.fromJson(accs));
    //     //print("id: " + accounts[iterate].id);
    //     iterate++;
    //   }
    //   print("last digit = " + accounts[0].id);
    //   int lastId = int.parse(accounts[0].id.toString());
    //   int nextId = lastId + 1;

    //   if (await request.registerAccount(nextId.toString(), email, password,
    //           mobile, status, freeAssignment, userType, gradeLevel) ==
    //       "true") {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //         new SnackBar(content: new Text('Registration successful')));
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //         new SnackBar(content: new Text('Registration successful')));
    //   }
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(new SnackBar(content: new Text('Invalid Input')));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.black,
            elevation: 0,
            title: Text(
              "Edit Personal Information",
              style: TextStyle(
                  fontFamily: 'Helvetica',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  letterSpacing: 1.5),
            ),
            centerTitle: true,
            backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
          child: Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              labelText: 'Norman',
                              labelStyle: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                              suffixIcon: Icon(
                                Icons.account_circle_outlined,
                              ),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              labelText: '123-456-987',
                              labelStyle: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                              suffixIcon: Icon(
                                Icons.phone_iphone,
                              ),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              validator: (value) {
                                String pattern =
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                RegExp regex = RegExp(pattern);
                                if (value == null ||
                                    value.isEmpty ||
                                    !regex.hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE6E6E6),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                labelText: 'normandobbs@gmail.com',
                                labelStyle: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                    letterSpacing: 2.0),
                                // prefixIcon: Icon(Icons.email),
                                suffixIcon: Icon(
                                  Icons.mail_outline_outlined,
                                ),
                              ),
                            ),
                          )),
                      Visibility(
                        visible: isVisibleSchoolField,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TypeAheadFormField(
                              direction: AxisDirection.up,
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: schoolController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE6E6E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  labelText: 'School Name ',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                      letterSpacing: 2.0),
                                  suffixIcon: Icon(Icons.school_outlined),
                                ),
                              ),
                              suggestionsCallback: (pattern) {
                                return Schools.getSuggestions(pattern);
                              },
                              noItemsFoundBuilder: (context) => Container(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'No schools found.',
                                        style: TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                            letterSpacing: 2.0),
                                      ),
                                    ),
                                  ),
                              onSuggestionSelected: (suggestion) {
                                this.schoolController.text =
                                    suggestion.toString();
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  trailing: Icon(Icons.school_outlined),
                                  title: Text(suggestion.toString()),
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text('Update & Save'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(400.0, 60),
                            primary: Color(0xff20b24d),
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Trueno',
                                letterSpacing: 1.5),
                          ),
                          onPressed: onUpdatePress,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
