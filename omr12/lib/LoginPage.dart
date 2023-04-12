import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omr12/auth_services.dart';
import 'ForgotPasswordPage.dart';
import 'ForgotPasswordVerificationPage.dart';
import 'RegistrationPage.dart';
import 'common/ThemeHelper.dart';
import 'home.dart';
import 'wigit/HeaderWidget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _isVisible = false;
  bool loading = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  double _headerHeight = 230;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String emails = '';
    String pas = '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  (Icons.lock)), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Email", "Enter your email"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email can't be empty";
                                    } else if (!RegExp(
                                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(value)) {
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: _isVisible ? false : true,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    hintText: "Enter Password",
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    suffixIcon: IconButton(
                                      onPressed: () => updateStatus(),
                                      icon: Icon(_isVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                  ),

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Password ";
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    "Forgot  password?",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text(
                                        'Sign In'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () async {
                                      print("sdbss");

                                      try {
                                        // if (_formKey.currentState!
                                        //     .validate())
                                        //   {

                                        if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {

                                          print("dggggggggg");
                                          print("aaaaaaaaaaaaaa");


                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: emailController.text.toString(), password: passwordController.text.toString())
                                              .then((value) {

                                            setState(() {
                                              loading = false;
                                            });
                                            Navigator.pushReplacement(
                                              (context),
                                              MaterialPageRoute(
                                                  builder: (context) => home()),
                                            );
                                          });
                                        } else {
                                          print("ssdfffffffffvg");
                                        }
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Error"),
                                              content: const Text(
                                                  "No user found for that email."),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    color: Colors.green,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("okay"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else if (e.code == 'wrong-password') {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text(
                                                  "Alert Dialog Box"),
                                              content: const Text(
                                                  "Wrong password provided for that user."),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    color: Colors.green,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("okay"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                    }),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Sign up',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _loading(bool loading) async {
    if (loading) {
      return CircularProgressIndicator();
    } else {
      return;
    }
  }
}
