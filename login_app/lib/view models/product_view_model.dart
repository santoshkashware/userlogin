import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/models/product_model.dart';
import 'package:login_app/services/firebase_db.dart';
import 'package:login_app/utils/validator.dart';

class ProductViewModel extends ChangeNotifier with ValidationMixin {
  TextEditingController? nameController,
      categoryController,
      priceController,
      descController;
  bool loadingView = false;

  void initializeObject() {
    if (nameController == null) nameController = new TextEditingController();
    if (categoryController == null)
      categoryController = new TextEditingController();
    if (priceController == null) priceController = new TextEditingController();
    if (descController == null) descController = new TextEditingController();
  }

  updateProduct() async {
    if (validateString(nameController!.text) != null) {
      showErrorView(message: "${validateString(nameController!.text)}");
      return;
    } else if (validateString(categoryController!.text) != null) {
      showErrorView(message: "${validateString(categoryController!.text)}");
      return;
    } else if (validateString(priceController!.text) != null) {
      showErrorView(message: "${validateString(priceController!.text)}");
      return;
    } else if (validateString(descController!.text) != null) {
      showErrorView(message: "${validateString(descController!.text)}");
      return;
    } else {
      notifyLoader(true);
      ProductModel model = new ProductModel(
          getRandomString(4),
          int.parse(priceController!.text),
          nameController!.text,
          descController!.text,
          categoryController!.text);
      await FirebaseDB().handleProductAdd(model).then((doc) {
        if (doc) {
          Get.snackbar("Info", "Product added ");
        } else {
          print('data is null');
        }
      }).catchError((e) {
        showErrorView(message: e);
      });
      notifyLoader(false);
    }
  }

  notifyLoader(bool state) {
    loadingView = state;
    notifyListeners();
  }

  hideKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
