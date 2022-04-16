import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerace/controllers/popular_product_controller.dart';
import 'package:e_commerace/controllers/recommended_product_controler.dart';
import 'package:e_commerace/pages/food/popular_food_detail.dart';
import 'package:e_commerace/routes/route_helper.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:e_commerace/widgets/icon_and_text_widget.dart';
import 'package:e_commerace/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction:0.85);
  var _currePageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currePageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
      //slider
      GetBuilder<PopularProductController>(builder:(popularProducts){
        return popularProducts.isLoaded?Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView,
             child: PageView.builder(
                controller: pageController,
                itemCount:popularProducts.popularProductList.length,
                itemBuilder: (context,position){
                  return _buildPageItem(position,popularProducts.popularProductList[position]);
                }
                ),
        ):
        CircularProgressIndicator(color: AppColors.mainColor);
      }),

      //dots
     GetBuilder<PopularProductController>(builder:(popularProducts){
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
          position: _currePageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        );
     }),
     //Popular text
     SizedBox(height: Dimensions.height30,),
     Container(
       margin: EdgeInsets.only(left: Dimensions.width30),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           BigText(text: "Recommended"),
           SizedBox(width: Dimensions.width10),
           Container(
             margin: const EdgeInsets.only(bottom: 3),
             child: BigText(text: ".",color: Colors.black26,),
           ),
           SizedBox(width: Dimensions.width10),
           Container(
             margin: const EdgeInsets.only(bottom: 2),
             child: SmallText(text: "Food pairing",),
           )
         ],
       ),
     ),
     // list of food and images
         GetBuilder<RecommendedProductController>(builder:(recommendedProduct){
            return recommendedProduct.isLoaded?ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        //image section
                        Container(
                          width:Dimensions.listViewImageSize,
                          height: Dimensions.listViewImageSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                 AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                              ),
                            ),
                          ),
                        ),
                        //text container
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20)
                                ),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text:recommendedProduct.recommendedProductList[index].name!),
                                  SizedBox(height: Dimensions.height10),
                                  SmallText(text: "With chinese Characteristics"),
                                  SizedBox(height: Dimensions.height10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(
                                          iconData: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1
                                      ),
                                      IconAndTextWidget(
                                          iconData: Icons.location_on,
                                          text: "1.7km",
                                          iconColor: AppColors.mainColor
                                      ),
                                      IconAndTextWidget(
                                          iconData: Icons.access_alarm_rounded,
                                          text: "32min",
                                          iconColor: AppColors.iconColor2
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },):CircularProgressIndicator(
              color: AppColors.mainColor,
            );
         })
       ],
    );
  }
  Widget _buildPageItem(int index, popularProduct){
    Matrix4 matrix4 = new Matrix4.identity();
    if(index ==_currePageValue.floor()){
       var currScale = 1 - (_currePageValue - index)*(1 - _scaleFactor);
       var currTrans = _height*(1-currScale)/2;
       matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currePageValue.floor()+1){
      var currScale = _scaleFactor+(_currePageValue-index+1)*(1 - _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currePageValue.floor()-1){
      var currScale = 1 - (_currePageValue - index)*(1 - _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1 - _scaleFactor)/2, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
         children: [
           GestureDetector(
             onTap:(){
               Get.toNamed(RouteHelper.getPopularFood(index,"home"));
             },
             child: Container(
               height: Dimensions.pageViewContainer,
               margin: EdgeInsets.only(left:Dimensions.width10,right:Dimensions.width10),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(Dimensions.radius30),
                   color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                   image: DecorationImage(
                       fit: BoxFit.cover,
                       image:NetworkImage(
                           AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                       )
                   )
               ),
             ),
           ),
           Align(
             alignment: Alignment.bottomCenter,
             child: Container(
               height: Dimensions.pageViewTextContainer,
               margin: EdgeInsets.only(left:Dimensions.width30,
                   right:Dimensions.width30,bottom:Dimensions.height30),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(Dimensions.radius20),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Color(0xFFe8e8e8),
                       blurRadius: 5.0,
                       offset: Offset(0,5)
                     ),
                     BoxShadow(
                       color: Colors.white,
                       offset: Offset(-5,0)
                     ),
                     BoxShadow(
                         color: Colors.white,
                         offset: Offset(5,0)
                     )
                   ]
               ),
               child: Container(
                 padding: EdgeInsets.only(top:Dimensions.height15,left: 15,right: 15),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     BigText(text:popularProduct.name),
                     SizedBox(height: Dimensions.height10),
                     Row(
                       children: [
                         Wrap(
                           children:
                             List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 15,))
                         ),
                         SizedBox(width: 10),
                         SmallText(text: "4.5"),
                         SizedBox(width: 10),
                         SmallText(text: "1287"),
                         SizedBox(width: 10),
                         SmallText(text: "comments")
                       ],
                     ),
                     SizedBox(height: Dimensions.height20),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                          IconAndTextWidget(
                              iconData: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: AppColors.iconColor1
                          ),
                         IconAndTextWidget(
                             iconData: Icons.location_on,
                             text: "1.7km",
                             iconColor: AppColors.mainColor
                         ),
                         IconAndTextWidget(
                             iconData: Icons.access_alarm_rounded,
                             text: "32min",
                             iconColor: AppColors.iconColor2
                         )
                       ],
                     )
                   ],
                 ),
               ),
             ),
           )
         ],
      ),
    );
  }
}
