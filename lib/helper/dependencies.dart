import 'package:e_commerace/data/api/api.dart';
import 'package:e_commerace/controllers/popular_product_controller.dart';
import 'package:e_commerace/data/repository/popular_product_repo.dart';
import 'package:e_commerace/data/repository/recommended_product_repo.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/recommended_product_controler.dart';

Future<void> init()async {
 //api client
 Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
 //repos
 Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
 Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

 //controllers
 Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
 Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));


}