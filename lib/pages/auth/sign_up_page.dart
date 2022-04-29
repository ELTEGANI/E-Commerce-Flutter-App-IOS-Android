import 'package:e_commerace/base/custom_loader.dart';
import 'package:e_commerace/base/show_custom_snackbar.dart';
import 'package:e_commerace/controllers/auth_controller.dart';
import 'package:e_commerace/models/signup_body_model.dart';
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
    void _registeration(AuthController authController){
      String name     = nameController.text.trim();
      String password = passwordController.text.trim();
      String email    = emailController.text.trim();
      String phone    = phoneController.text.trim();
      if(name.isEmpty){
        showCustomSnackBar("Typed in your name",title:"Name");
      }else if(email.isEmpty){
        showCustomSnackBar("Typed in your email address",title:"Email Address");
      }else if(phone.isEmpty){
        showCustomSnackBar("Typed in your phone number",title:"Phone Number");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Typed in your valid email address",title:"Valid Email Address");
      }else if(password.isEmpty){
        showCustomSnackBar("Typed in your password",title:"Password");
      }else if(password.length<6){
        showCustomSnackBar("password cant be less than 6 characters",title:"Password");
      }else{
        SignUpBody signUpBody = SignUpBody(name: name, phone: phone, email: email, password: password);
        authController.registeration(signUpBody).then((status){
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
      body:GetBuilder<AuthController>(builder:(_authController){
        return !_authController.isLoading?SingleChildScrollView(
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
                  hintText:"Password", iconData:Icons.password_sharp,isObscure:true),
              SizedBox(height:Dimensions.height20),
              AppTextField(
                  textEditingController:nameController,
                  hintText:"Name", iconData:Icons.person),
              SizedBox(height:Dimensions.height20),
              AppTextField(
                  textEditingController:phoneController,
                  hintText:"Phone", iconData:Icons.phone),
              SizedBox(height:Dimensions.height20),
              GestureDetector(
                onTap:(){
                  _registeration(_authController);
                },
                child: Container(
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
        ):const CustomLoader();
      }),
    );

  }

}
