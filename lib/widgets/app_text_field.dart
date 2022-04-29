import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String  hintText;
  final IconData iconData;
  bool isObscure;
  AppTextField({Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.iconData,
    this.isObscure=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left:Dimensions.height20,
          right:Dimensions.height20),
      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(Dimensions.radius15),
          boxShadow:[
            BoxShadow(
                blurRadius:3,
                spreadRadius:1,
                offset:Offset(1,1),
                color:Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child:TextField(
        obscureText:isObscure?true:false,
        controller: textEditingController,
        decoration: InputDecoration(
          //hint
            hintText:hintText,
            //prefixIcon
            prefixIcon: Icon(iconData,color:AppColors.yellowColor,),
            //focusedBorder
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    Dimensions.radius15
                ),
                borderSide: BorderSide(
                    width: 1.0,
                    color:Colors.white
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                borderSide: BorderSide(
                    width: 1.0,
                    color:Colors.white
                )
            ),
            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius15)
            )
        ),
      ),
    );
  }
}
