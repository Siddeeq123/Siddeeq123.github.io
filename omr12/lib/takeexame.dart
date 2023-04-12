import 'package:flutter/material.dart';
import 'package:omr12/home.dart';

import 'package:omr12/two_class.dart';

class twobutton extends StatefulWidget {
  const twobutton({Key? key}) : super(key: key);

  @override
  _twobuttonState createState() => _twobuttonState();
}

class _twobuttonState extends State<twobutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: ElevatedButton(
              child: Text("Check Quiz "),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => home()), (route) => false);
              },
            )),
            SizedBox(height: 20,),
            Container(
                child: Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: Text("Take Quiz "),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage(title: "quiz ",)), (route) => false);},
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
