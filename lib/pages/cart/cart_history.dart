import 'package:e_commerace/controllers/cart_controller.dart';
import 'package:e_commerace/utils/app_constants.dart';
import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_icon.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:e_commerace/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistory = Get.find<CartController>().getCartHistoryList();
    Map<String,int> cartItemsPerOrder = Map();
    for(int i =0;i < getCartHistory.length;i++){
      if(cartItemsPerOrder.containsKey(getCartHistory[i].time)){
        cartItemsPerOrder.update(getCartHistory[i].time!,(value)=>++value);
      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistory[i].time!,()=>1);
      }
    };

    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e)=>e.value).toList();
    }

    List<int> orderTimes = cartOrderTimeToList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height:100,
            color:AppColors.mainColor,
            width:double.maxFinite,
            padding:EdgeInsets.only(top:45),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History",color:Colors.white),
                AppIcon(iconData: Icons.shopping_cart_outlined,iconColor:AppColors.mainColor,backColor: AppColors.yellowColor,)
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left:Dimensions.height20,
                right:Dimensions.height20
              ),
              child:MediaQuery.removePadding(
                  removeTop:true,
                  context: context,
                  child:ListView(
                  children: [
                    for(int i = 0;i < cartItemsPerOrder.length;i++)
                      Container(
                        height:120,
                        margin:EdgeInsets.only(bottom:Dimensions.height20),
                        child:Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            BigText(text: "05/02/2021"),
                            SizedBox(height:Dimensions.height10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction:Axis.horizontal,
                                  children: List.generate(orderTimes[i], (index){
                                    if(listCounter<getCartHistory.length){
                                      listCounter++;
                                    }
                                    return index<=2?
                                    Container(
                                      height:  80,
                                      width: 80,
                                      margin:EdgeInsets.only(right:Dimensions.width10/2),
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(Dimensions.radius15/2),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistory[listCounter-1].img!
                                              )
                                          )
                                      ),
                                    ):Container();
                                  }),
                                ),
                                Container(
                                  height:80,
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SmallText(text: "Total"),
                                      BigText(text:orderTimes[i].toString(),color:AppColors.titleColor,)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  ]
              )),
            ),
          )
        ],
      ),
    );
  }
}
