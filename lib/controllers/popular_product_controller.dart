import 'package:e_commerace/controllers/cart_controller.dart';
import 'package:e_commerace/data/repository/popular_product_repo.dart';
import 'package:e_commerace/models/products_model.dart';
import 'package:e_commerace/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cartController;

  bool  _isLoaded = false;
  bool get isLoaded=>_isLoaded;
  int _quantity = 0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=>_inCartItems+_quantity;

  Future<void> getPopularProductList() async {
     Response response = await popularProductRepo.getPopularProductList();
     if(response.statusCode ==  200){
       _popularProductList = [];
       _popularProductList.addAll(Product.fromJson(response.body).products);
       _isLoaded=true;
       update();
     }else{
       print("response");
     }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      Get.snackbar("Item count","You can't reduce more",backgroundColor:AppColors.mainColor,
      colorText:Colors.white
      );
       return 0;
    }else if ((_inCartItems+quantity)>20){
      Get.snackbar("Item count","You can't add more",backgroundColor:AppColors.mainColor,
          colorText:Colors.white
      );
       return 20;
    }else{
      return quantity;
    }
  }
  void initProduct(ProductModel productModel,CartController cartController){
    _quantity = 0;
    _inCartItems = 0;
    _cartController=cartController;
    var exist=false;
    exist = _cartController.existInCart(productModel);
    print("exsit or not"+exist.toString());
    if(exist){
      _inCartItems=_cartController.getQuantity(productModel);
    }
    print("the quantity in the item cart is"+_inCartItems.toString());
  }

  void addItem(ProductModel productModel){
    // if(_quantity>0){
       _cartController.addItem(productModel,_quantity);
       _quantity = 0;
       _inCartItems=_cartController.getQuantity(productModel);
       _cartController.items.forEach((key, value) {
         print("The id is"+value.id.toString()+"The quantity is "+value.quantity.toString());
      });
    update();
  }

  int get totalItems{
    return _cartController.totalItems;
  }

}