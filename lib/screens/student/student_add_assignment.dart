import 'dart:convert';

import 'package:edcheckv2/internals/school.dart';
import 'package:edcheckv2/internals/subject.dart';
import 'package:edcheckv2/terms/policy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class StudentAddAssignment extends StatefulWidget {
  const StudentAddAssignment({Key? key}) : super(key: key);

  @override
  _StudentAddAssignmentState createState() => _StudentAddAssignmentState();
}

class _StudentAddAssignmentState extends State<StudentAddAssignment> {
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();

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

  void onSubmitPress() async {
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
              "Add new assignment",
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
                        this.subjectController.text = suggestion.toString();
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(suggestion.toString()),
                        );
                      }),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        labelText: 'Title',
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
                    controller: descriptionController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE6E6E6),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      labelText: 'Description',
                      labelStyle: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          letterSpacing: 2.0),

                      // prefixIcon: Icon(Icons.message_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Attachments",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        letterSpacing: 2.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.upload_file_outlined,
                            color: Colors.green,
                            size: 24.0,
                          ),
                          label: Text(
                            'Upload Picture',
                            style: TextStyle(color: Colors.green),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300.0, 60),
                            primary: Color(0xfff9f9f9),
                            textStyle: const TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                letterSpacing: 1.5),
                          ),
                          onPressed: onSubmitPress,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text('Submit'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(400.0, 60),
                            primary: Color(0xff20b24d),
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Trueno',
                                letterSpacing: 1.5),
                          ),
                          onPressed: onSubmitPress,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ));
  }
}
