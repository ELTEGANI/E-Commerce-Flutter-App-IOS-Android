import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_icon.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key? key,required this.appIcon,required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       padding:EdgeInsets.only(left:Dimensions.width20,
       top:Dimensions.width10,bottom:Dimensions.width10
       ),
      child: Row(
         children: [
           appIcon,
           SizedBox(width:Dimensions.width20),
           bigText
         ],
      ),
      decoration:BoxDecoration(
        color:Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius:2,
            offset: Offset(0,5),
            color:Colors.grey.withOpacity(0.2)
          )
        ]
      ),
    );
  }
}
