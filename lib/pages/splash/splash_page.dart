import 'dart:async';

import 'package:e_commerace/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controler.dart';
import '../../routes/route_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
  late Animation<double>animation;
  late AnimationController _animationController;

  Future<void> _loadResource() async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){
    super.initState();
    _loadResource();
    _animationController =  AnimationController(vsync: this,duration:const Duration(seconds:2))..forward();
    animation =  CurvedAnimation(parent: _animationController, curve: Curves.linear);
    Timer(
      const Duration(seconds:3),
        ()=> Get.offNamed(RouteHelper.getInitial())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
       body:Column(
         mainAxisAlignment:MainAxisAlignment.center,
         children: [
           ScaleTransition(scale: animation,
           child: Center(child: Image.asset("assets/image/logo part 1.png",width:Dimensions.splashImage))),
           Center(child: Image.asset("assets/image/logo part 2.png",width:Dimensions.splashImage,))
         ],
       ),
    );
  }
}
