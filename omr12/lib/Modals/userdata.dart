import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDATA{
  String? _first;
  String? _second;
  String? _email;


  getdata() async {
    await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((DocumentSnapshot ds) {
      this._first=ds.get('firstnanme');
      this._second=ds.get('name');
      this._email=ds.get('email');
    });
  }
}
