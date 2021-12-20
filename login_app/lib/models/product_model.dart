import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  int? price;
  String? name;
  String? description;
  String? category;

  ProductModel(this.id, this.price, this.name, this.description, this.category);
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    category = json['category'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
  ProductModel.fromDocument(DocumentSnapshot json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
  }
}
