import 'package:e_commerace/pages/auth/sign_up_page.dart';
import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_text_field.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController){
      String password = passwordController.text.trim();
      String email    = emailController.text.trim();
     if(email.isEmpty){
        showCustomSnackBar("Typed in your email address",title:"Email Address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Typed in your valid email address",title:"Valid Email Address");
      }else if(password.isEmpty){
        showCustomSnackBar("Typed in your password",title:"Password");
      }else{
        authController.login(email,password).then((status){
          if(status.isSuccess){
            showCustomSnackBar("Success Registeration");
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor:Colors.white,
      body:SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height:Dimensions.screenHeight*0.05),
            Container(
              height:Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor:Colors.white,
                  radius:80,
                  backgroundImage: AssetImage(
                      "assets/image/logo part 1.png"
                  ),
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.only(left:Dimensions.width20),
              width:double.maxFinite,
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("Hello",style:TextStyle(
                    fontSize:Dimensions.font16*3+Dimensions.font20/2,
                    fontWeight:FontWeight.bold
                  ),
                  ),
                  Text("Sign into your account",style:TextStyle(
                      fontSize:Dimensions.font20,
                      color:Colors.grey[500]
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height:Dimensions.screenHeight*0.05,),
            AppTextField(
                textEditingController:emailController,
                hintText:"Email", iconData:Icons.email),
            SizedBox(height:Dimensions.height20),
            AppTextField(
                textEditingController:passwordController,
                hintText:"Password", iconData:Icons.password_sharp,isObscure:true),
            SizedBox(height:Dimensions.height20),
            SizedBox(height:Dimensions.height10,),
            Row(
              children: [
                Expanded(child:Container()),
                RichText(text: TextSpan(
                    text:"Sign into your account",
                    style:TextStyle(
                        color:Colors.grey[500],
                        fontSize: Dimensions.font20
                    )
                )),
                SizedBox(width:Dimensions.height20,)
              ],
            ),
            SizedBox(height:Dimensions.screenHeight*0.05,),
            Container(
              width:Dimensions.screenWidth/2,
              height:Dimensions.screenHeight/13,
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(Dimensions.radius30),
                  color:AppColors.mainColor
              ),
              child:Center(
                child: BigText(
                  text:"Sign in",
                  size:Dimensions.font20+Dimensions.font20/2,
                  color:Colors.white,
                ),
              ),
            ),
            SizedBox(height:Dimensions.screenHeight*0.05,),
            RichText(text: TextSpan(
                text:"Dont\'t an account?",
                style:TextStyle(
                    color:Colors.grey[500],
                    fontSize: Dimensions.font20
                ),
              children:[
                TextSpan(
                recognizer:TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition:Transition.fade),
                text:" Create",
                style:TextStyle(
                    fontWeight:FontWeight.bold,
                    color:AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                )
                )
              ]
            ),
            ),
          ],
        ),
      ),

    );

  }
}
