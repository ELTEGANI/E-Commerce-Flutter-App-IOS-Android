import 'package:e_commerace/pages/food/popular_food_detail.dart';
import 'package:e_commerace/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial ="/";
  static const String  popularFood = "/popular-food";

  static String getInitial()=>'$initial';
  static String  getPopularFood()=>'$popularFood';


  static List<GetPage> routes = [
    GetPage(name:initial, page:()=>MainFoodPage()),

    GetPage(name:popularFood,page:(){
      return PopularFoodDetial();
    },
      transition:Transition.fadeIn
    ),
  ];
}