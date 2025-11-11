import 'package:blog_app/screen/signUpScreen/widget/custom_text.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:blog_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../helper/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
        title: Text(
          "Create Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.03
                        : size.height * 0.02,
                  ),
                  CustomText(title: "Username"),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.02
                        : size.height * 0.01,
                  ),
                  CustomTextField(
                    hinText: "username",
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.04
                        : size.height * 0.03,
                  ),
                  CustomText(title: "Email"),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.02
                        : size.height * 0.01,
                  ),
                  CustomTextField(
                    hinText: "email",
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.04
                        : size.height * 0.03,
                  ),
                  CustomText(title: "Phone"),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.02
                        : size.height * 0.01,
                  ),
                  CustomTextField(
                    hinText: "Phone",
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.04
                        : size.height * 0.03,
                  ),
                  CustomText(title: "Password"),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.02
                        : size.height * 0.01,
                  ),
                  CustomTextField(
                    hinText: "Password",
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.04
                        : size.height * 0.03,
                  ),
                  CustomText(title: "Confirm Password"),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.02
                        : size.height * 0.01,
                  ),
                  CustomTextField(
                    hinText: "Confirm Password",
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.06
                        : size.height * 0.05,
                  ),
                  CustomButton(title: "Register",onTap: () {
                    Navigator.pushNamed(context, AppRoute.login);
                  },),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.08
                        : size.height * 0.07,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
