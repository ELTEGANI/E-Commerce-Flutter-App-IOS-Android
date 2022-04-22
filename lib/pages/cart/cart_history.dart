import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color:AppColors.mainColor,
            width:double.maxFinite,
            child:Row(
              children: [
                BigText(text: "Cart History",color:Colors.white,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
