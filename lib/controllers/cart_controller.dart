import 'package:e_commerace/data/repository/cart_repo.dart';
import 'package:e_commerace/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cartModel.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int,CartModel> get items=>_items;
  List<CartModel> storageItems = [];
  void addItem(ProductModel productModel, int quantity) {
    var tottalQuantity=0;
    if(_items.containsKey(productModel.id!)){
      _items.update(productModel.id!, (value){
      tottalQuantity=value.quantity!+quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            description: value.description,
            price: value.price,
            img: value.img,
            quantity:value.quantity!+quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: productModel
        );
      });
      if(tottalQuantity<=0){
        _items.remove(productModel.id);
      }
    }else{
      if(quantity>0){
        _items.putIfAbsent(productModel.id!, () {
          return CartModel(
              id: productModel.id,
              name: productModel.name,
              description: productModel.description,
              price: productModel.price,
              img: productModel.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: productModel
          );
        }
        );
      }else{
        Get.snackbar("Item count","You Should at least add item in the cart",backgroundColor:AppColors.mainColor,
            colorText:Colors.white
        );
      }
    }
    cartRepo.addToList(getItems);
     update();
  }

  bool existInCart(ProductModel productModel){
    if(_items.containsKey(productModel.id)){
      return true;
    }
    return false;
  }

 int getQuantity(ProductModel productModel){
     var quantity=0;
     if(_items.containsKey(productModel.id!)){
         _items.forEach((key, value) {
           if(key==productModel.id){
              quantity = value.quantity!;
           }
         });
     }
     return quantity;
  }

  int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    return _items.entries.map((e){
      return e.value;
    }).toList();
  }

  int get totalAmount{
    var total = 0;
    _items.forEach((key, value) {
       total += value.quantity!*value.price!;
    });
    return total;
  }

  List<CartModel> getCartData(){
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel>items){
    storageItems= items;
    for(int i = 0;i < storageItems.length;i++){
     _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory(){
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList(){
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int,CartModel>setItems){
    _items = {};
    _items = setItems;
  }

  void addToCartList(){
    cartRepo.addToList(getItems);
    update();
  }

  void clearCartHistory(){
    cartRepo.clearCarHistory();
    update();
  }
}