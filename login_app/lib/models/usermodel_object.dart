import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModelObject {
  String? fName;
  String? lName;
  String? mobile;
  String? email;
  String? gender;
  String? dob;
  String? password;

  UserModelObject(
      {this.fName, this.lName, this.mobile, this.email, this.gender, this.dob, this.password});

  UserModelObject.fromJson(Map<String, dynamic> json) {
    fName = json['fName'];
    lName = json['lName'];
    mobile = json['mobile'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['password'] = this.password;
    return data;
  }
  UserModelObject.fromDocumnet(DocumentSnapshot json) {
    fName = json['fName'];
    lName = json['lName'];
    mobile = json['mobile'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    password = json['password'];
  }
}
