import 'package:e_commerace/controllers/cart_controller.dart';
import 'package:e_commerace/controllers/popular_product_controller.dart';
import 'package:e_commerace/controllers/recommended_product_controler.dart';
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
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
   return GetBuilder<PopularProductController>(builder:(_){
    return GetBuilder<RecommendedProductController>(builder:(_){
     return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Flutter Demo',
       //home:SignInPage(),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
     );
    });
   });
  }
}


