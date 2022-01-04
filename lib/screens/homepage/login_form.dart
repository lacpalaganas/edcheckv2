// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:edcheckv2/screens/homepage/recover_password.dart';
import 'package:edcheckv2/screens/homepage/register_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  //final Function(String) callback;
  // LoginForm();

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool rememberMe = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final recoverEmailController = TextEditingController();
  final recoverPasswordController = TextEditingController();

  final APIKEY = "e1eb74bc5148970392bd89e2d0822f29e27fc9c1";

  //added var
  bool isObscure = true;

  void onRememberMeChanged(bool? rememberMeCheckBox) {
    setState(() {
      rememberMe = rememberMeCheckBox ?? true;
      print("Check Box: " + rememberMe.toString());
    });
  }

  onLoginPress() async {
    // print('login pressed');

    // var networkHandler = RequestHandler(APIKEY);
    // String data = await networkHandler.confirmAccount(
    //     emailControler.text, passwordControler.text);
    // if (data != "0") {
    //   var jsonData = jsonDecode(data);
    //   dynamic acc = jsonData;
    //   Account acc2 = Account.fromJson(acc[0]);

    //   print("there is" + acc2.id.toString());
    //   if (acc2.loginStatus.toString() == "1") {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(new SnackBar(content: new Text('Login successful')));

    //     final prefs = await SharedPreferences.getInstance();

    //     prefs.setBool('loggedIn', rememberMe);
    //     prefs.setString('id', acc2.id.toString());
    //     prefs.setString('email', acc2.email.toString());
    //     print("Remember is checked: " + rememberMe.toString());
    //     var newNetwork = RequestHandler(
    //         "0328fjkasdocaksdut209029350293jrlMFLSAJDFPAOUW09IRW");
    //     newNetwork.sendQuery(acc2.email.toString(), acc2.id.toString());

    //     widget.callback("student");
    //   } else {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(new SnackBar(content: new Text('Login Failed!')));
    //   }
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(new SnackBar(content: new Text('Login Failed!')));
    // }
  }

  void onRecoverPress() {
    // gendialog();
  }

  void onSubmitPress() {
    print('submit pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
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
                          'Hello There',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Trueno',
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                              letterSpacing: 1.0),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              color: Color(0xff20b24d),
                              fontFamily: 'Trueno',
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0),
                        ),
                      ],
                    )),
                SizedBox(height: 4.0),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            letterSpacing: 2.0),
                        suffixIcon: Icon(
                          Icons.mail_outline_outlined,
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
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          letterSpacing: 2.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'Forgot Password?',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecoverPassword(),
                                  ));
                            },
                          style: TextStyle(
                            color: Color(0xff20b24d),
                            fontSize: 16.0,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: <Widget>[
                //     Checkbox(value: rememberMe, onChanged: onRememberMeChanged),
                //     Text("Remember me")
                //   ],
                // ),
                SizedBox(
                  height: 16,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400.0, 60),
                      primary: Color(0xff20b24d),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Trueno',
                          letterSpacing: 1.5),
                    ),
                    onPressed: onLoginPress,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(left: 14.0, right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign up.',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterForm(),
                                        ));
                                  },
                                style: TextStyle(
                                    color: Color(0xff20b24d),
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
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 140.0,
                      width: 140.0,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 120,
                              width: 120.0,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              decoration: BoxDecoration(
                                  //  shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffe9f8ee),
                                    )
                                  ],
                                  border: Border.all(
                                      width: 10.0,
                                      style: BorderStyle.solid,
                                      color: Color(0xffe9f8ee)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1562246229-37b3aca47e18?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"))),
                              // child:
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Student",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 140.0,
                      width: 140.0,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 120,
                              width: 120.0,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              decoration: BoxDecoration(
                                  //  shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffe9f8ee),
                                    )
                                  ],
                                  border: Border.all(
                                      width: 10.0,
                                      style: BorderStyle.solid,
                                      color: Color(0xffe9f8ee)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"))),
                              // child:
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Tutor",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
