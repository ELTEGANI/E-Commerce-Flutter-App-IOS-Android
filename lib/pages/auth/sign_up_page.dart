import 'package:e_commerace/utils/colors.dart';
import 'package:e_commerace/utils/dimensions.dart';
import 'package:e_commerace/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
      backgroundColor:Colors.white,
      body:Column(
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
        ],
      ),
    );
  }
}
