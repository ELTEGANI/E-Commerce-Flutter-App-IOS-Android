import 'package:e_commerace/controllers/auth_controller.dart';
import 'package:e_commerace/controllers/cart_controller.dart';
import 'package:e_commerace/controllers/user_controller.dart';
import 'package:e_commerace/data/api/api.dart';
import 'package:e_commerace/controllers/popular_product_controller.dart';
import 'package:e_commerace/data/repository/auth_repo.dart';
import 'package:e_commerace/data/repository/cart_repo.dart';
import 'package:e_commerace/data/repository/popular_product_repo.dart';
import 'package:e_commerace/data/repository/recommended_product_repo.dart';
import 'package:e_commerace/data/repository/user_repo.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/recommended_product_controler.dart';


Future<void> init()async {
 final sharedPreference = await SharedPreferences.getInstance();
 Get.lazyPut(()=>sharedPreference);
 //api client
 Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL,sharedPreference:Get.find()));
 Get.lazyPut(()=>AuthRepo(apiClient:Get.find(),sharedPreferences:Get.find()));
 Get.lazyPut(()=>UserRepo(apiClient:Get.find()));
 //repos
 Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
 Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
 Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));
 //controllers
 Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
 Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
 Get.lazyPut(() => CartController(cartRepo: Get.find()));
 Get.lazyPut(() => AuthController(authRepo:Get.find()));
 Get.lazyPut(() => UserController(userRepo:Get.find()));

}