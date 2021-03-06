import 'package:e_commerace/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  String? description;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;


  CartModel({this.id,
    this.name,
    this.description,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product=ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product":this.product!.toJson()
    };
  }
}