import 'package:e_commerace/controllers/cart_controller.dart';
import 'package:e_commerace/pages/home/main_food_page.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_icon.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:e_commerace/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            Positioned(
                top:Dimensions.height20*3,
                left:Dimensions.width20,
                right:Dimensions.width20,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    iconData:Icons.arrow_back_ios,
                    iconColor:Colors.white,
                    backColor:AppColors.mainColor,iconSize:
                    Dimensions.iconSize24,),
                  SizedBox(width: Dimensions.width20*5),
                  GestureDetector(
                    onTap:(){
                      Get.to(()=>MainFoodPage());
                    },
                    child: AppIcon(iconData:Icons.home_outlined,iconColor:Colors.white,backColor:AppColors.mainColor,iconSize:
                    Dimensions.iconSize24,),
                  ),
                  AppIcon(iconData:Icons.shopping_cart,iconColor:Colors.white,backColor:AppColors.mainColor,iconSize:
                  Dimensions.iconSize24,)
                ],
            )),
            Positioned(
                top:Dimensions.height20*5,
                left:Dimensions.width20,
                right:Dimensions.width20,
                bottom:0,
                child: Container(
                  margin:EdgeInsets.only(top:Dimensions.height15),
                  child:MediaQuery.removePadding(
                    context:context,
                    removeTop: true,
                    child: GetBuilder<CartController>(builder:(cartController){
                      return ListView.builder(
                          itemCount:cartController.getItems.length,
                          itemBuilder: (_,index){
                            return Container(
                              width: double.maxFinite,
                              height:Dimensions.height20*5,
                              child:Row(
                                children: [
                                  Container(
                                    width:Dimensions.height20*5,
                                    height:Dimensions.height20*5,
                                    margin:EdgeInsets.only(bottom:Dimensions.height10),
                                    decoration:BoxDecoration(
                                        image:DecorationImage(
                                            fit:BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!
                                            )
                                        ),
                                        borderRadius:BorderRadius.circular(Dimensions.radius20),
                                        color:Colors.white
                                    ),
                                  ),
                                  SizedBox(width:Dimensions.width10,),
                                  Expanded(child: Container(
                                    height:Dimensions.height20*5,
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(text:cartController.getItems[index].name!,color:Colors.black54),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(text:cartController.getItems[index].price.toString(),color:Colors.redAccent),
                                            Container(
                                              padding: EdgeInsets.only(top:Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width20),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                  color: Colors.white
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap:(){
                                                        // popularProduct.setQuantity(false);
                                                      },
                                                      child: Icon(Icons.remove,color:AppColors.signColor,)
                                                  ),
                                                  SizedBox(width: Dimensions.width10/2),
                                                  BigText(text:"0"),
                                                  SizedBox(width: Dimensions.width10/2),
                                                  GestureDetector(
                                                      onTap:(){
                                                        //      popularProduct.setQuantity(true);
                                                      },
                                                      child: Icon(Icons.add,color:AppColors.signColor,)
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          });
                    }),
                  ),
                ))
          ],
        ),
    );
  }
}
