import 'package:e_commerace/controllers/popular_product_controller.dart';
import 'package:e_commerace/controllers/recommended_product_controler.dart';
import 'package:e_commerace/pages/cart/cart_page.dart';
import 'package:e_commerace/pages/food/recommended_food_detail.dart';
import 'package:e_commerace/pages/home/food_page_body.dart';
import 'package:e_commerace/pages/home/main_food_page.dart';
import 'package:e_commerace/pages/splash/splash_page.dart';
import 'package:e_commerace/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return GetBuilder<PopularProductController>(builder:(_){
    return GetBuilder<RecommendedProductController>(builder:(_){
     return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Flutter Demo',
       initialRoute: RouteHelper.getSplashPage(),
       getPages: RouteHelper.routes,
     );
    });
   });
  }
}


