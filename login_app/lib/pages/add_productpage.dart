import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_app/utils/masked_text_controller.dart';
import 'package:login_app/view%20models/product_view_model.dart';
import 'package:login_app/widgets/cutom_buttom.dart';
import 'package:login_app/widgets/spacer_view.dart';
import 'package:login_app/widgets/textform.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductViewModel>(context);
    productModel.initializeObject();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              // key: loginViewModel.loginFormKey,
              child: Column(
                children: [
                  InputFieldArea(
                    controller: productModel.nameController!,
                    obscureText: false,
                    labelText: "name",
                    iconData: Icons.email,
                    inputFormatter: MaskTextInputFormatter(),
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                    controller: productModel.categoryController!,
                    obscureText: false,
                    labelText: "category",
                    inputFormatter: MaskTextInputFormatter(),
                    iconData: Icons.lock,
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                    controller: productModel.priceController!,
                    obscureText: false,
                    labelText: "Price",
                    inputFormatter: MaskTextInputFormatter(),
                    iconData: Icons.lock,
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  InputFieldArea(
                    controller: productModel.descController!,
                    obscureText: false,
                    labelText: "Desc",
                    inputFormatter: MaskTextInputFormatter(),
                    iconData: Icons.lock,
                  ),
                  SpacerView(
                    spaceSize: 16,
                  ),
                  CustomButton(
                      labelText: "Add Product",
                      onPressed: () {
                        productModel.hideKeyBoard(context);
                        productModel.updateProduct();
                      }),
                  SpacerView(
                    spaceSize: 20,
                  ),
                  productModel.loadingView
                      ? SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20,
                        )
                      : SpacerView(
                          spaceSize: 0,
                        ),
                  SpacerView(
                    spaceSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
