

import 'package:flutter/material.dart';
import 'package:fracturedtection/screens/changePassword/provider/changeProvider.dart';
import 'package:fracturedtection/screens/intro/provider/introProvider.dart';
import 'package:fracturedtection/screens/login/provider/loginProvider.dart';
import 'package:fracturedtection/screens/registration/provider/registrationProvider.dart';
import 'package:fracturedtection/screens/splash/view/splashPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IntroProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    ),
  );
}
