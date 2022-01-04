import 'dart:convert';

import 'package:edcheckv2/internals/school.dart';
import 'package:edcheckv2/internals/subject.dart';
import 'package:edcheckv2/terms/policy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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

  void onRegisterPress() async {
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
            toolbarHeight: 100,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/edcheckLogo.png',
                  fit: BoxFit.contain,
                  height: 70,
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
          child: Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 1.0),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Create an Account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Trueno',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0),
                            ),
                            Text(
                              '.',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Trueno',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              labelText: 'Student or Tutor'),
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              color: Color(0xff1d1d1d),
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              letterSpacing: 2.0),
                          isExpanded: true,
                          value: userTypeSelected,
                          items: userDropdownItems,
                          onChanged: onUserChanged,
                        ),
                      ),
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
                              labelText: 'Your Name',
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
                              labelText: 'Phone number',
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
                                labelText: 'Email',
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
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(isObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE6E6E6),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                letterSpacing: 2.0),
                            //  prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisibleSubjectField,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TypeAheadFormField(
                              direction: AxisDirection.up,
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: subjectController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE6E6E6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  labelText: 'Subject',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                      letterSpacing: 2.0),
                                  suffixIcon: Icon(
                                    Icons.book_outlined,
                                  ),
                                ),
                              ),
                              suggestionsCallback: (pattern) {
                                return Subjects.getSuggestions(pattern);
                              },
                              noItemsFoundBuilder: (context) => Container(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'No subject found.',
                                        style: TextStyle(
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                            letterSpacing: 2.0),
                                      ),
                                    ),
                                  ),
                              onSuggestionSelected: (suggestion) {
                                this.subjectController.text =
                                    suggestion.toString();
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text(suggestion.toString()),
                                );
                              }),
                        ),
                      ),
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
                      Visibility(
                        visible: isVisibleBioField,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: bioController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE6E6E6),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              labelText: 'Your Bio',
                              labelStyle: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                              suffixIcon: Icon(
                                Icons.message_outlined,
                              ),
                              // prefixIcon: Icon(Icons.message_outlined),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: agreement,
                            onChanged: (value) {
                              setState(() {
                                agreement = value ?? false;
                                print(agreement);
                              });
                            },
                          ),
                          Expanded(
                              child: RichText(
                            text: TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(
                                  color: Color(0xff1d1d1d),
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Terms of Service, ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Policy(
                                                    path:
                                                        'assets/policies/terms_conditions.md',
                                                  )),
                                        );
                                      },
                                    style: TextStyle(
                                        color: Color(0xff20b24d),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                        letterSpacing: 2.0)),
                                TextSpan(
                                    text: 'Cookie Policy, ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Policy(
                                                    path:
                                                        'assets/policies/cookie_policy.md',
                                                  )),
                                        );
                                      },
                                    style: TextStyle(
                                        color: Color(0xff20b24d),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                        letterSpacing: 2.0)),
                                TextSpan(
                                    text: 'Legal Disclaimer, ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Policy(
                                                    path:
                                                        'assets/policies/legal_disclaimer.md',
                                                  )),
                                        );
                                      },
                                    style: TextStyle(
                                        color: Color(0xff20b24d),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                        letterSpacing: 2.0)),
                                TextSpan(
                                    text: 'and Privacy Policy. ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Policy(
                                                    path:
                                                        'assets/policies/privacy_policy.md',
                                                  )),
                                        );
                                      },
                                    style: TextStyle(
                                        color: Color(0xff20b24d),
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                        letterSpacing: 2.0)),
                              ],
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text('Sign up'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(400.0, 60),
                            primary: Color(0xff20b24d),
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Trueno',
                                letterSpacing: 1.5),
                          ),
                          onPressed: agreement ? onRegisterPress : null,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.only(left: 14.0, right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Have an account already? ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Sign in.',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        },
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16.0,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void onUserChanged(String? newValue) {
    setState(() {
      userTypeSelected = newValue!;

      if (userTypeSelected == "1") {
        isVisibleSchoolField = true;
      } else {
        isVisibleSchoolField = false;
      }

      if (userTypeSelected == "2") {
        isVisibleSubjectField = true;
        isVisibleBioField = true;
      } else {
        isVisibleSubjectField = false;
        isVisibleBioField = false;
      }

      print(newValue);
    });
  }
}
