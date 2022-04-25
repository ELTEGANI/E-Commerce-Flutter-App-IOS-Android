import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/account_widget.dart';
import 'package:e_commerace/widgets/app_icon.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:AppColors.mainColor,
        title: BigText(
          text:"Profile",
          size:24,
          color:Colors.white ,
        ),
      ),
      body:Container(
        width:double.maxFinite,
        margin:EdgeInsets.only(top:Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(iconData:Icons.person,backColor:AppColors.mainColor,iconColor: Colors.white,
            iconSize:Dimensions.height45+Dimensions.height30,size:Dimensions.height15*10),
            SizedBox(height:Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                        appIcon:AppIcon(iconData:Icons.person,backColor:AppColors.mainColor,iconColor: Colors.white,
                            iconSize:Dimensions.height10*5/2,
                            size:Dimensions.height10*5),
                        bigText:BigText(text:"Ahmed")
                    ),
                    SizedBox(height:Dimensions.height20),
                    //phone
                    AccountWidget(
                        appIcon:AppIcon(iconData:Icons.phone,
                            backColor:AppColors.yellowColor,iconColor: Colors.white,
                            iconSize:Dimensions.height10*5/2,
                            size:Dimensions.height10*5),
                        bigText:BigText(text:"1234567890")
                    ),
                    SizedBox(height:Dimensions.height20),
                    //email
                    AccountWidget(
                        appIcon:AppIcon(iconData:Icons.email,
                            backColor:AppColors.yellowColor,iconColor: Colors.white,
                            iconSize:Dimensions.height10*5/2,
                            size:Dimensions.height10*5),
                        bigText:BigText(text:"Ahmed@xxxxx")
                    ),
                    SizedBox(height:Dimensions.height20),
                    //address
                    AccountWidget(
                        appIcon:AppIcon(iconData:Icons.location_on,
                            backColor:AppColors.yellowColor,iconColor: Colors.white,
                            iconSize:Dimensions.height10*5/2,
                            size:Dimensions.height10*5),
                        bigText:BigText(text:"Fill in Your Address")
                    ),
                    SizedBox(height:Dimensions.height20),
                    //message
                    AccountWidget(
                        appIcon:AppIcon(iconData:Icons.message_outlined,
                            backColor:Colors.redAccent ,
                            iconColor: Colors.white,
                            iconSize:Dimensions.height10*5/2,
                            size:Dimensions.height10*5),
                        bigText:BigText(text:"Ahmed")
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
