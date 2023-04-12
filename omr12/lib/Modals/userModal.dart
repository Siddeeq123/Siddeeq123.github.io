class UserModel{
  String firstname;
  String lastname;
  String email;
  String phoneNo;
  String password;
//  UserModel({this.uid,this.name,this.email,this.phoneNo});
  UserModel({ required this.firstname,required this.lastname, required this.email,required this.phoneNo, required this.password});

  //data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(
      firstname: map['firstname'],
      lastname: map['lastname'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      password: map['password'],


    );
  }

// sending data to server
  Map<String, dynamic> toMap()
  {
    return
      {
        'firstnanme': firstname,
        'name': lastname,
        'email': email,
        'phoneNo':phoneNo,
        'password':password,

      };
  }
}