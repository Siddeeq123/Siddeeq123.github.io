import 'package:flutter/material.dart';

class myregister extends StatelessWidget {
  const myregister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(60, 80, 60,80),
          child: TextField(

            decoration: InputDecoration(
                border:  OutlineInputBorder( ),
                labelText: "Fast name ",
                hintText: "Enter fiast  name "
            ),
          )
        ),
      Center(
        child: Container(
          child: TextField(
          decoration: InputDecoration(
            hintText: "last name",
            labelText: "Enter last name "

          ),
        ),),
      )],



    ),

    );
  }
}
