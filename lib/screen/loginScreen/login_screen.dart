import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:blog_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        centerTitle: true,
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
          "Sign in",
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: isLandscape ? size.height * 0.03 : size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: isLandscape
                          ? size.width * 0.03
                          : size.height * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.07 : size.height * 0.03,
                ),
                CustomTextField(
                  hinText: 'Email',
                  width: isLandscape ? size.width * 0.6 : double.infinity,
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.07 : size.height * 0.03,
                ),
                CustomTextField(
                  hinText: 'Password',
                  width: isLandscape ? size.width * 0.6 : double.infinity,
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.12 : size.height * 0.08,
                ),
                CustomButton(
                  title: "Sign in",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.navView);
                  },
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.07 : size.height * 0.4,
                ),
                Column(
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(color: AppColors.hintColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoute.signUp);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
