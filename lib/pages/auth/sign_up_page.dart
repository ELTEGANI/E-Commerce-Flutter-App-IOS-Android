import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_text_field.dart';
import 'package:e_commerace/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png"
    ];
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
            AppTextField(
                textEditingController:emailController,
                hintText:"Email", iconData:Icons.email),
            SizedBox(height:Dimensions.height20),
            AppTextField(
                textEditingController:passwordController,
                hintText:"Password", iconData:Icons.password_sharp),
            SizedBox(height:Dimensions.height20),
            AppTextField(
                textEditingController:nameController,
                hintText:"Name", iconData:Icons.person),
            SizedBox(height:Dimensions.height20),
            AppTextField(
                textEditingController:phoneController,
                hintText:"Phone", iconData:Icons.phone),
            SizedBox(height:Dimensions.height20),
            Container(
              width:Dimensions.screenWidth/2,
              height:Dimensions.screenHeight/13,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(Dimensions.radius30),
                color:AppColors.mainColor
              ),
              child:Center(
                child: BigText(
                  text:"Sign Up",
                  size:Dimensions.font20+Dimensions.font20/2,
                  color:Colors.white,
                ),
              ),
            ),
            SizedBox(height:Dimensions.height10,),
            RichText(text: TextSpan(
              recognizer:TapGestureRecognizer()..onTap=()=>Get.back(),
              text:"Have an Account Already?",
              style:TextStyle(
                color:Colors.grey[500],
                fontSize: Dimensions.font20
              )
            )),
            SizedBox(height:Dimensions.screenHeight*0.05,),
            RichText(text: TextSpan(
                text:"Sign up using one of the following methods",
                style:TextStyle(
                    color:Colors.grey[500],
                    fontSize: Dimensions.font16
                )
            )),
            Wrap(
              children:List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius:Dimensions.radius30,
                  backgroundImage:AssetImage(
                    "assets/image/"+signUpImages[index]
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
