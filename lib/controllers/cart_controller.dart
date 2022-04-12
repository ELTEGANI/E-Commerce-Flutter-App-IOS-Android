import 'package:e_commerace/data/repository/cart_repo.dart';
import 'package:e_commerace/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cartModel.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int,CartModel> get items=>_items;

  void addItem(ProductModel productModel, int quantity) {
    if(_items.containsKey(productModel.id!)){
      _items.update(productModel.id!, (value){
        return CartModel(
            id: value.id,
            name: value.name,
            description: value.description,
            price: value.price,
            img: value.img,
            quantity:value.quantity!+quantity,
            isExist: true,
            time: DateTime.now().toString()
        );
      });
    }else{
      _items.putIfAbsent(productModel.id!, () {
        return CartModel(
            id: productModel.id,
            name: productModel.name,
            description: productModel.description,
            price: productModel.price,
            img: productModel.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString()
        );
      }
      );
    }

  }
}