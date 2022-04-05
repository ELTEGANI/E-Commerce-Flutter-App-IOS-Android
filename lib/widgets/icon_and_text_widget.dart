 import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconAndTextWidget extends StatelessWidget {
   final IconData iconData;
   final String text;
   final Color iconColor;

   const IconAndTextWidget({Key? key,
     required this.iconData,
     required this.text,
     required this.iconColor
   }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Row(
       children: [
         Icon(iconData,color: iconColor,size: Dimensions.iconSize24),
         SizedBox(width: 5),
         SmallText(text:text)
       ],
     );
   }
 }
 