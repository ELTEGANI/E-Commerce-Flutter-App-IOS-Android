import 'package:e_commerace/controllers/cart_controller.dart';
import 'package:e_commerace/controllers/popular_product_controller.dart';
import 'package:e_commerace/controllers/recommended_product_controler.dart';
import 'package:e_commerace/pages/home/main_food_page.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_column.dart';
import 'package:e_commerace/widgets/app_icon.dart';
import 'package:e_commerace/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetial extends StatelessWidget {
  final int pageId;
  const PopularFoodDetial({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
               width: double.maxFinite,
               height: Dimensions.popularFoodImgSize,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image: NetworkImage(
                     AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                   )
                 )
               ),
          )),
          //icon widget
          Positioned(
              top:Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  GestureDetector(
                      onTap:(){
                        Get.to(()=>MainFoodPage());
                      },
                      child:
                      AppIcon(iconData: Icons.arrow_back_ios)),
                      AppIcon(iconData: Icons.shopping_cart_outlined)
              ],
          )),
          //introduction
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top:Dimensions.popularFoodImgSize-20,
              child: Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20
                  ),
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(Dimensions.radius20),
                     topLeft:  Radius.circular(Dimensions.radius20)
                   ),
                   color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     AppColumn(text:product.name!),
                     SizedBox(height: Dimensions.height20),
                     BigText(text: "Introduce"),
                     SizedBox(height: Dimensions.height20),
                     Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text:product.description!)))
                   ],
                ),
              )),

        ],
      ),
      bottomNavigationBar:GetBuilder<PopularProductController>(builder:(popularProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top:Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20
          ),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(Dimensions.radius20*2),
                  topRight: Radius.circular(Dimensions.radius20*2)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap:(){
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove,color:AppColors.signColor,)
                    ),
                    SizedBox(width: Dimensions.width10/2),
                    BigText(text:popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10/2),
                    GestureDetector(
                        onTap:(){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add,color:AppColors.signColor,)
                    )
                  ],
                ),
              ),
              Container(
                child:GestureDetector(
                    onTap:(){
                     popularProduct.addItem(product);
                    },
                    child: BigText(text:"\$${product.price!} "+"| Add to Cart",color: Colors.white,)),
                padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
