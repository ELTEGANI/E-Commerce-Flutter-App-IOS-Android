import 'package:e_commerace/base/custom_loader.dart';
import 'package:e_commerace/controllers/auth_controller.dart';
import 'package:e_commerace/controllers/cart_controller.dart';
import 'package:e_commerace/controllers/user_controller.dart';
import 'package:e_commerace/routes/route_helper.dart';
import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/account_widget.dart';
import 'package:e_commerace/widgets/app_icon.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
     Get.find<UserController>().getUserInfo();
     print("User has loggedIn");
    }
    return Scaffold(
      appBar:AppBar(
        backgroundColor:AppColors.mainColor,
        title: BigText(
          text:"Profile",
          size:24,
          color:Colors.white ,
        ),
      ),
      body:GetBuilder<UserController>(builder:(userController){
        return _userLoggedIn?(userController.isLoading?
        Container(
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
                          bigText:BigText(text:userController.userModel.name)
                      ),
                      SizedBox(height:Dimensions.height20),
                      //phone
                      AccountWidget(
                          appIcon:AppIcon(iconData:Icons.phone,
                              backColor:AppColors.yellowColor,iconColor: Colors.white,
                              iconSize:Dimensions.height10*5/2,
                              size:Dimensions.height10*5),
                          bigText:BigText(text:userController.userModel.phone)
                      ),
                      SizedBox(height:Dimensions.height20),
                      //email
                      AccountWidget(
                          appIcon:AppIcon(iconData:Icons.email,
                              backColor:AppColors.yellowColor,iconColor: Colors.white,
                              iconSize:Dimensions.height10*5/2,
                              size:Dimensions.height10*5),
                          bigText:BigText(text:userController.userModel.email)
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
                          bigText:BigText(text:"Messages")
                      ),
                      SizedBox(height:Dimensions.height20),
                      //message
                      GestureDetector(
                        onTap:(){
                          if(Get.find<AuthController>().userLoggedIn()){
                            Get.find<AuthController>().clearSharedData();
                            Get.find<CartController>().clear();
                            Get.find<CartController>().clearCartHistory();
                            Get.offNamed(RouteHelper.getSignInPage());
                          }else{
                            print("you log out");
                          }
                        },
                        child: AccountWidget(
                            appIcon:AppIcon(iconData:Icons.logout,
                                backColor:Colors.redAccent ,
                                iconColor: Colors.white,
                                iconSize:Dimensions.height10*5/2,
                                size:Dimensions.height10*5),
                            bigText:BigText(text:"Logout")
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ):
        const CustomLoader()):
        Center(child:Text("You Must Login"));
      }),
    );
  }
}
