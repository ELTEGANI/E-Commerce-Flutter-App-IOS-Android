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
     cart=[];
     cartList.forEach((element) {
       cart.add(jsonEncode(element));
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

   void addToCartHistoryList(){
     for(int i =0;i < cart.length;i++){
        cartHistory.add(cart[i]);
     }
     removeCart();
     sharedPreferences.setStringList(AppConstants.cartHistoryList,cartHistory);
   }

   void removeCart(){
     sharedPreferences.remove(AppConstants.CART_LIST);
   }
}