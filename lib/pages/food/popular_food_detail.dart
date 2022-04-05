import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularFoodDetial extends StatelessWidget {
  const PopularFoodDetial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
               width: double.maxFinite,
               height: Dimensions.popularFoodImgSize,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image: AssetImage(
                     "assets/image/food0.png"
                   )
                 )
               ),
          )),
          Positioned(
              top:Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  AppIcon(iconData: Icons.arrow_back_ios),
                  AppIcon(iconData: Icons.shopping_cart_outlined)
              ],
          )),

        ],
      ),
    );
  }
}
