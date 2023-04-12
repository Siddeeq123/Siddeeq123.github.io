import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omr12/verify_email.dart';
import 'LoginPage.dart';
import 'Modals/userModal.dart';
import 'common/ThemeHelper.dart';
import 'home.dart';
import 'wigit/HeaderWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{
  final _auth=FirebaseAuth.instance;
  TextEditingController fastnamecontroller = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  bool checkedValue = false;
  bool checkboxValue = false;
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    String email1='',  password1='';


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Stack(

          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 20, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: fastnamecontroller,

                            decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
                            onSaved: (value){fastnamecontroller.text=value.toString();},
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please first name ";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: lastnameController,
                            decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
                            onSaved: (value){lastnameController.text=value.toString();},
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please  last name";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value){emailController.text=value.toString();},
                            onChanged: (value){
                              email1=value;



                            },
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: mobilenumberController,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number",
                                "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            onSaved: (value){mobilenumberController.text=value.toString();},
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText:  _isVisible? false : true,
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
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }
                                    ),
                                    Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(35, 1, 35, 1),
                              child: Text(
                                "Register".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                print(emailController.text);
                                print(passwordController.text);


                                await _auth
                                    .createUserWithEmailAndPassword(email: emailController.text, password:passwordController.text)
                                    .then((value) => {

                                  postDetailsToFirestore()
                                })
                                    .catchError((e) {
                                  //       progressDialog.dismiss();
                                  //      showErrorDialog(context, e.message);

                                });
                                //   Navigator.pushNamed(context, 'home');
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print('The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                    (context),
                                    MaterialPageRoute(builder: (context) => LoginPage                                          ()),
                                        (route) => false);
                              }
                            },
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
  postDetailsToFirestore() async {


    final  user = _auth.currentUser!;
    try {

      final uid = user.uid;
      FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
      //Firestore firebaseFirestore = Firestore.instance;

      UserModel userModel = UserModel(firstname:fastnamecontroller.text,lastname: lastnameController.text,email: emailController.text,phoneNo: passwordController.text, password: passwordController.text);

      // writing all the values

      // userModel.firstname = user.uid;
      // userModel. = fullNameController.text;
      //  userModel.email = user.email;
      //  userModel.phoneNo = phoneNoController.text;

      await firebaseFirestore.collection("Users").doc(user.uid)
          .set(userModel.toMap());
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false);
    } catch (e) {
      print(e);
    }

  }

}