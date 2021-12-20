import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app/models/product_model.dart';
import 'package:login_app/models/usermodel_object.dart';
import 'package:login_app/view%20models/product_view_model.dart';

class FirebaseDB {
  Future<bool> handleRegister(String email, UserModelObject model) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      await users.doc(email).set(model.toJson());
      print('santi caling data for save ');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<DocumentSnapshot?> handleLogin(String email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      DocumentSnapshot data = await users.doc(email).get();
      print('santi caling data for save ');
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<QuerySnapshot?> handlFeed({DocumentSnapshot? dataValue}) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('product');
    try {
      QuerySnapshot data;
      if (dataValue != null) {
        data = await users.limit(1).startAfterDocument(dataValue).get();
      } else {
        data = await users.limit(1).get();
      }

      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> handleProductAdd(ProductModel model) async {
    CollectionReference users = FirebaseFirestore.instance.collection('product');

    try {
      await users.add(model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
