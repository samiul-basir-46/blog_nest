import 'package:blog_app/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widget/custom_text_field.dart';
import '../../signUpScreen/widget/custom_text.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

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
          "Update Password",
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
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Current Password"),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.02
                        : size.height * 0.01,
                  ),
                  CustomTextField(
                    obsText: false,
                    hinText: "Enter your current password",
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.04
                        : size.height * 0.03,
                  ),
                  CustomText(title: "New password"),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.02
                        : size.height * 0.01,
                  ),
                  CustomTextField(
                    obsText: false,
                    hinText: "Enter your new password",
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
                    obsText: false,
                    hinText: "Confirm your new password",
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.09
                        : size.height * 0.4,
                  ),
                  CustomButton(title: "Update Password")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
