import 'package:e_commerace/data/api/api.dart';
import 'package:e_commerace/data/popular_product_controller.dart';
import 'package:e_commerace/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> init()async {
 //api client
 Get.lazyPut(()=>ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));
 //repos
 Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

 //controllers
 Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}