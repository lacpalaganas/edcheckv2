import 'dart:convert';

import 'package:edcheckv2/internals/school.dart';
import 'package:edcheckv2/internals/subject.dart';
import 'package:edcheckv2/terms/policy.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class StudentAssignmentDetails extends StatefulWidget {
  const StudentAssignmentDetails({Key? key}) : super(key: key);

  @override
  _StudentAssignmentDetailsState createState() =>
      _StudentAssignmentDetailsState();
}

class _StudentAssignmentDetailsState extends State<StudentAssignmentDetails> {
  final feedbackController = TextEditingController();
  final addDescriptionController = TextEditingController();

  //added var
  bool isObscure = true;

  bool isVisibleResponseField = false;
  bool isVisibleResponseButton = true;

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
              "Assignment Details",
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
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            color: Colors.white,
            child: ListView(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Chapter 2.1 \n",
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Color(0xff1d1d1d),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                  letterSpacing: 1.5),
                            ),
                            TextSpan(
                              text: "Mathematics",
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  letterSpacing: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Unchecked \n",
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Color(0xff20b24d),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Submitted: Today, 8:00 AM ",
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Color(0xff1d1d1d),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                  letterSpacing: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'There are many variations of passages of Lorem Ipsum available,'
                        'but the majority have suffered alteration in some form, by injected humour, or randomised words which'
                        'do not look even slightly believable. If you are going to use a passage of Lorem Ipsum,'
                        'you need to be sure there is not anything embarrassing hidden in the middle of text.'
                        'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,'
                        'making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words,'
                        'combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.'
                        'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic '
                        'words etc.',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Color(0xff1d1d1d),
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            letterSpacing: 1.5),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Attachments",
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Color(0xff1d1d1d),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.builder(
                    primary: false,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1618044733300-9472054094ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"),
                                  fit: BoxFit.cover),
                            )),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GestureDetector(
                                    onLongPress: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.grey,
                                          content: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Download",
                                                    style: TextStyle(
                                                        fontFamily: 'Trueno',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.0),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () async {
                                                            // try {
                                                            //   var imageId = await ImageDownloader
                                                            //       .downloadImage(
                                                            //           _imagesStudent[
                                                            //               index]);
                                                            //   // Fluttertoast
                                                            //   //     .showToast(
                                                            //   //   msg:
                                                            //   //       'Image Saved',
                                                            //   //   toastLength: Toast
                                                            //   //       .LENGTH_SHORT,
                                                            //   //   gravity:
                                                            //   //       ToastGravity
                                                            //   //           .BOTTOM,
                                                            //   //   timeInSecForIosWeb:
                                                            //   //       1,
                                                            //   //   backgroundColor:
                                                            //   //       Colors.white,
                                                            //   //   textColor:
                                                            //   //       Colors.black,
                                                            //   // );

                                                            // } on PlatformException catch (error) {
                                                            //   print(error);
                                                            // }
                                                          }),
                                                WidgetSpan(
                                                  child: Icon(
                                                    Icons.download,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    // child: ImagePreview(
                                    //     imagePath: _imagesStudent[index]),
                                  )));
                        },
                      );
                    }),
              ),
              Container(
                color: Color(0xfff9f9f9),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Tutor's Response",
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    color: Color(0xff1d1d1d),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18.0,
                                    letterSpacing: 1.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Today, 8:00 AM ",
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'There are many variations of passages of Lorem Ipsum available,'
                        'but the majority have suffered alteration in some form, by injected humour, or randomised words which'
                        'do not look even slightly believable. If you are going to use a passage of Lorem Ipsum,'
                        'you need to be sure there is not anything embarrassing hidden in the middle of text.'
                        'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,'
                        'making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words,'
                        'combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.'
                        'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic '
                        'words etc.',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Color(0xff1d1d1d),
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            letterSpacing: 1.5),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Visibility(
                visible: isVisibleResponseField,
                child: Container(
                  color: Color(0xfffff5f3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "My Response",
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      color: Color(0xffff4619),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                      letterSpacing: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isVisibleResponseField,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: addDescriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE6E6E6),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      labelText: 'Descrition',
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
              Visibility(
                visible: isVisibleResponseField,
                child: Padding(
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
              ),
              Visibility(
                visible: isVisibleResponseField,
                child: Padding(
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
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isVisibleResponseField,
                child: Padding(
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
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isVisibleResponseButton,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text('Respond'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(400.0, 60),
                            primary: Color(0xff20b24d),
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Trueno',
                                letterSpacing: 1.5),
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Divider(
                                        height: 1,
                                        thickness: 4,
                                        indent: 150,
                                        endIndent: 150,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 15.0),
                                      Text(
                                        "Choose your respond choice",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14.0,
                                            letterSpacing: 2),
                                      ),
                                      SizedBox(height: 2.0),
                                      Padding(
                                        padding: EdgeInsets.all(0),
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              width: double.infinity,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                child: Text('Great! Thank you.',
                                                    style: TextStyle(
                                                      color: Color(0xff1d1d1d),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18.0,
                                                    )),
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(400.0, 60),
                                                  primary: Color(0xfff9f9f9),
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Trueno',
                                                      letterSpacing: 1.5),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isVisibleResponseField =
                                                        false;
                                                  });
                                                  Navigator.pop(context);
                                                },
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                child: Text(
                                                    'Please explain more.',
                                                    style: TextStyle(
                                                      color: Color(0xffff4619),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily: 'Helvetica',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18.0,
                                                    )),
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(400.0, 60),
                                                  primary: Color(0xfff9f9f9),
                                                  textStyle: const TextStyle(
                                                      fontSize: 20,
                                                      fontFamily: 'Trueno',
                                                      letterSpacing: 1.5),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isVisibleResponseField =
                                                        true;
                                                    isVisibleResponseButton =
                                                        false;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ]),
          ),
        ));
  }
}
