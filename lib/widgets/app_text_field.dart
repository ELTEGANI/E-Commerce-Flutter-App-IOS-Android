import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String  hintText;
  final IconData iconData;
  const AppTextField({Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left:Dimensions.height20,
          right:Dimensions.height20),
      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(Dimensions.radius30),
          boxShadow:[
            BoxShadow(
                blurRadius: 10,
                spreadRadius:7,
                offset:Offset(1,10),
                color:Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child:TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          //hint
            hintText:hintText,
            //prefixIcon
            prefixIcon: Icon(iconData,color:AppColors.yellowColor,),
            //focusedBorder
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    Dimensions.radius30
                ),
                borderSide: BorderSide(
                    width: 1.0,
                    color:Colors.white
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.0,
                    color:Colors.white
                )
            ),
            border:OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.0,
                    color:Colors.white
                )
            )
        ),
      ),
    );
  }
}
