import 'dart:convert';

import 'package:e_commerace/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cartModel.dart';

class CartRepo{
   final SharedPreferences sharedPreferences;
   CartRepo({required this.sharedPreferences});
   List<String> cart=[];
   List<String> cartHistory=[];

   void addToList(List<CartModel> cartList){
     var time = DateTime.now().toString();
     cart=[];
     cartList.forEach((element) {
       element.time =time;
      return cart.add(jsonEncode(element));
     });
     sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
     print(sharedPreferences.getStringList(AppConstants.CART_LIST));
     getCartList();
   }
   List<CartModel> getCartList(){
     List<String> carts = [];
     if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
       carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
       print("inside getCartList"+carts.toString());
     }
     List<CartModel> cartList = [];
     carts.forEach((element)=>cartList.add(CartModel.fromJson(jsonDecode(element))));

     return cartList;
   }

   List<CartModel> getCartHistoryList(){
      if(sharedPreferences.containsKey(AppConstants.cartHistoryList)){
         cartHistory=[];
         cartHistory = sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
      }
      List<CartModel> cartListHistory=[];
      cartHistory.forEach((element)=>cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
      return cartListHistory;
   }

   void addToCartHistoryList(){
     if(sharedPreferences.containsKey(AppConstants.cartHistoryList)){
       cartHistory = sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
     }
     for(int i =0;i < cart.length;i++){
        cartHistory.add(cart[i]);
     }
     removeCart();
     sharedPreferences.setStringList(AppConstants.cartHistoryList,cartHistory);
   }

   void removeCart(){
     cart = [];
     sharedPreferences.remove(AppConstants.CART_LIST);
   }

   void clearCarHistory(){
     removeCart();
     cartHistory=[];
     sharedPreferences.remove(AppConstants.cartHistoryList);
   }
}