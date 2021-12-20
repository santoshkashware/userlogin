import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/models/product_model.dart';
import 'package:login_app/models/usermodel_object.dart';
import 'package:login_app/routes/app_pages.dart';
import 'package:login_app/services/firebase_db.dart';
import 'package:login_app/utils/validator.dart';

class FeedViewModel extends ChangeNotifier with ValidationMixin {
  List<ProductModel> userList = [];
  DocumentSnapshot? userDoc;
  ScrollController? controller = new ScrollController();

  initializeController() {
    controller!.addListener(() {
      if (controller!.position.pixels == controller!.position.maxScrollExtent) {
        getData();
      }
    });
  }

  getData() async {
    await FirebaseDB()
        .handlFeed(dataValue: userDoc)
        .then((QuerySnapshot? data) {
      data!.docs.forEach((element) {
        ProductModel user = ProductModel.fromDocument(element);
        userList.add(user);
        userDoc = element;
      });
      notifyListeners();
    }).catchError((e) {
      print('calling state ${e.toString()}');
      showErrorView(message: e.toString());
    });
  }
  navigateToAddProduct() async {
    Get.toNamed(Routes.ADD_PRODUCT);
  }

}
