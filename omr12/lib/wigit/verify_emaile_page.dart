
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:omr12/LoginPage.dart';
import 'package:omr12/wigit/verify_emaile.dart';

class mainpage extends StatelessWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: StreamBuilder<User?>(stream:FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot){
      if(snapshot.hasData)
  {
    return mainpage();
  }
      else{
        return LoginPage();
  }
  })
  );

}
