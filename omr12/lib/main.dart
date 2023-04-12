

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:omr12/LoginPage.dart';
import 'package:omr12/RegistrationPage.dart';
import 'package:omr12/home.dart';
import 'package:omr12/onbord_screen.dart';
import 'package:omr12/verify_email.dart';

import 'SplashScreen.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  runApp(

      LoginUiApp(


  ));
}
class LoginUiApp extends StatelessWidget {

  Color _primaryColor = HexColor('#90EE90');
  Color _accentColor = HexColor('#90EE90');
 //  Color _accentColor = HexColor('#8A02AE');
 // Color _primaryColor = HexColor('#DC54FE');


  // Design color
  // Color _primaryColor= HexColor('#FFC867');
   //Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
   //Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
//  Color _primaryColor= HexColor('#651BD2');
 // Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,

      title: 'OMR',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,

        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home:

          SplashScreen(title: "OMR",),

    );
  }
}