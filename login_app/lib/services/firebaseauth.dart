// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:login_app/models/usermodel_object.dart';

class FirebaseData {

  Future<String> handleSignInEmail(
      String email, UserModelObject model) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("users");
    DatabaseReference child = ref.child(email.replaceAll(".", ","));
    await child.set(model.toJson());
    return "OK";
  }

  Future<bool> handleUpdate(String email, UserModelObject model) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/${email.replaceAll(".", ",")}");
    await ref.set(model.toJson());
    return true;
  }

  Future<UserModelObject> handleUserData(String email) async {
    UserModelObject dataModel = new UserModelObject();
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/${email.replaceAll(".", ",")}");
    DatabaseEvent event = await ref.once();
    if (event.snapshot.value != null) {
      final jsonData = event.snapshot.value as Map<dynamic, dynamic>;
      final validMap =
          json.decode(json.encode(jsonData)) as Map<String, dynamic>;
      return UserModelObject.fromJson(validMap);
    }
    return dataModel;
  }
}
