import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omr12/wigit/HeaderWidget.dart';

import 'LoginPage.dart';

import 'common/ThemeHelper.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController Name = TextEditingController();
  String _first = "Muhammad";
  String _second = "Siddeeq";
  String Names = "";
  late String _email;
  double _drawerIconSize = 24;
  double _drawerFontSize = 20;
  late File _image = File("");
  final picker = ImagePicker();
  static String result = "";
  bool checkresult = false;
  Future<String> fetchPost(File check) async {
    try {
      // var url = Uri.parse("http://ce7b-35-198-249-6.ngrok.io/upload");
      var url = Uri.parse("http://achi123.pythonanywhere.com/upload");

      var newrequest = http.MultipartRequest(
        "GET",
        url,
      );
      String fileName2 = check.path.split('/').last;
      print("1");
      final picture = await http.MultipartFile.fromPath('file', check.path,
          filename: fileName2);
      //print("check request");
      print("2");
      newrequest.files.add(picture);
      print("3");
      var response = await newrequest.send();
      print("response of data is:  " + response.toString());
      var responseData = await response.stream.toBytes();
      //print("responseData of data is:  "+responseData.toString());
      print("4");
      var resul = String.fromCharCodes(responseData);
      setState(() {
        checkresult = true;
        result = resul;
      });

      print("result of data is:  " + resul);

      //print("responseData of data is:  "+responseData.toString());

    } catch (e) {
      return "_model";
      //log(e.toString())0;
    }
    return "_model";
  }

  Future getfromCamreImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getfromgalleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void Initiate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                const Icon(Icons.home),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    _first.toUpperCase().toString() +
                        "     " +
                        _second.toUpperCase().toString(),
                    style: const TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,
                    size: _drawerIconSize, color: Colors.white),
                title: Text(
                  'Login Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout_rounded,
                    size: _drawerIconSize, color: Colors.white),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            Container(
              height: 100,
              child: const HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.home,
                      size: 50,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Container(
                  //   child: TextFormField(
                  //     controller: Name,
                  //     decoration: ThemeHelper().textInputDecoration(
                  //         'Full Name', 'Enter your Full name'),
                  //     onChanged: (value) {
                  //       Names = Name.text.toString();
                  //
                  //     },
                  //     validator: (val) {
                  //       if (val!.isEmpty) {
                  //         return "Please first name ";
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  // ),
                  // SizedBox(height: 30,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(

                      children: [

                        Container(
                          color: Colors.deepOrange,
                          height: 150,
                          width: 190,
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Gallery',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              getfromgalleryImage();
                            },
                          ),
                        ),
                        SizedBox(width: 30,),
                        Container(
                          color: Colors.deepOrange,
                          height: 150,
                          width: 190,
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Camera',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              getfromCamreImage();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 30),

                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),

                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'check'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        if (_image != "") {
                          fetchPost(_image);
                        } else {}
                      },
                    ),
                    // decoration: ThemeHelper().buttonBoxDecoration(context),
                  ),
                  const SizedBox(height: 30),
                  Center(
                      child: Text(
                    _image.path == "" ? "No File Selected Yet" : _image.path,
                  )),
                  const SizedBox(height: 30),
                  Center(
                      child: Text(
                    "Result : " + result,
                  )),
                  Text(Names)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
