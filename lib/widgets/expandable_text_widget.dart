import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
   ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();

}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secoundHalf;
  bool hiddenText=true;
  double textHight = Dimensions.screenHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHight){
      firstHalf = widget.text.substring(0,textHight.toInt());
      secoundHalf = widget.text.substring(textHight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secoundHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:secoundHalf.isEmpty?SmallText(color:AppColors.paraColor,size:Dimensions.font16,text:firstHalf):Column(
          children: [
            SmallText(height:1.8,color:AppColors.paraColor,size:Dimensions.font16,text: hiddenText?(firstHalf+"..."):(firstHalf+secoundHalf)),
            InkWell(
              onTap: (){
                  setState(() {
                    hiddenText=!hiddenText;
                  });
              },
              child:Row(
                children: [
                  SmallText(text: "Show more",color:AppColors.mainColor,),
                  Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color:AppColors.mainColor,)
                ],
              ),
            )
          ],
      ),
    );
  }
}
