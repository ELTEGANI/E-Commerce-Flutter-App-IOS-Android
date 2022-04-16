import 'package:e_commerace/pages/cart/cart_page.dart';
import 'package:e_commerace/pages/food/popular_food_detail.dart';
import 'package:e_commerace/pages/food/recommended_food_detail.dart';
import 'package:e_commerace/pages/home/main_food_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial ="/";
  static const String  popularFood = "/popular-food";
  static const String  recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String  getInitial()=>'$initial';
  static String  getPopularFood(int pageId,String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String  getRecommendedFood(int pageId,String page)=>'$recommendedFood?pageId=$pageId&page=$page';
  static String  getCartPage()=> '$cartPage';

  static List<GetPage> routes = [
    GetPage(name:initial, page:()=>MainFoodPage()),

    GetPage(name:popularFood,page:(){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetial(pageId:int.parse(pageId!),page:page!);
    },
      transition:Transition.fadeIn
    ),

    GetPage(name:recommendedFood,page:(){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId:int.parse(pageId!),page:page!);
    },
        transition:Transition.fadeIn
    ),
     GetPage(name:cartPage, page:(){
       return CartPage();
     },
       transition: Transition.fadeIn
     )

  ];
}