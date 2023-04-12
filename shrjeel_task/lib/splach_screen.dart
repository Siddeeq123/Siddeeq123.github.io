import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shrjeel_task/register.dart';

import 'login.dart';

class mysplashsreen extends StatefulWidget {
  const mysplashsreen({Key? key}) : super(key: key);

  @override
  _mysplashsreenState createState() => _mysplashsreenState();
}

class _mysplashsreenState extends State<mysplashsreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration (seconds:5) ,
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> myregister()) )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar:AppBar(title: Text("spash sreen")
      ),
      body: Center(

        child: Column(

          children: [
            Container(
              margin:EdgeInsets.fromLTRB(30, 150, 80, 60),
              child: CircleAvatar(
                radius: 70,
                backgroundImage:
                 AssetImage("images/pic.jpg")
        ),
            )



          ],
        )
      ),
    );
  }
}
