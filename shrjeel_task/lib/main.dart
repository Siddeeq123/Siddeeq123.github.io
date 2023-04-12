import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shrjeel_task/forgat_password.dart';
import 'package:shrjeel_task/home.dart';
import 'package:shrjeel_task/login.dart';
import 'package:shrjeel_task/register.dart';
import 'package:shrjeel_task/splach_screen.dart';

void main() {
  runApp( MaterialApp(
debugShowCheckedModeBanner: false,
    initialRoute: 'splach_screen' ,
    routes:{
      'splach_screen':(context)=>mysplashsreen(),
      'login':(context)=>mylogin(),
      'register':(context)=>myregister(),
      'home':(context)=>myhome(),
      'forgate_password':(context)=>myforgat()

  }
  ));
}


