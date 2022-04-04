import 'package:e_commerace/home/food_page_body.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:e_commerace/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           Container(
             child: Container(
               margin: const EdgeInsets.only(top: 45,bottom: 15),
               padding: const EdgeInsets.only(left: 20,right: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     children: [
                       BigText(text: "United Arab Emirates",color: AppColors.mainColor,),
                       Row(
                         children: [
                           SmallText(text: "Dubai",color: Colors.black54),
                           const Icon(Icons.arrow_drop_down_rounded)
                         ],
                       )
                     ],
                   ),
                   Center(
                     child: Container(
                       width: 45,
                       height: 45,
                       child: const Icon(Icons.search,color: Colors.white,),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         color:AppColors.mainColor,

                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
           FoodPageBody()
         ],
       ),
    );
  }
}
