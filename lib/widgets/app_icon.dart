import 'package:e_commerace/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color backColor;
  final Color iconColor;
  final double size;

   AppIcon({Key? key,
   required this.iconData,
       this.backColor=const Color(0xFFfcf4e4),
       this.iconColor=const Color(0xFF756d54),
       this.size =40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: size,
       height: size,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(size/2),
         color: backColor
       ),
      child: Icon(
        iconData,
        color: iconColor,
        size:Dimensions.iconSize16,
      ),
    );
  }
}
