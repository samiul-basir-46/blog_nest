import 'package:blog_app/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widget/custom_text_field.dart';
import '../../signUpScreen/widget/custom_text.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: isLandscape ? size.width * 0.03 : size.height * 0.02,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.02,
                      ),
                      Container(
                        height: isLandscape
                            ? size.height * 0.25
                            : size.height * 0.14,
                        width: isLandscape
                            ? size.width * 0.2
                            : size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.02,
                      ),
                      Text(
                        "Ethan Carter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLandscape
                              ? size.width * 0.03
                              : size.height * 0.024,
                        ),
                      ),
                      Text(
                        "ethan.carter@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isLandscape
                              ? size.width * 0.02
                              : size.height * 0.019,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.03 : size.height * 0.02,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: "Display Name"),

                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.02
                            : size.height * 0.01,
                      ),
                      CustomTextField(
                        obsText: false,
                        hinText: "Ethan Carter",
                        width: isLandscape ? size.width * 0.6 : double.infinity,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.04 : size.height * 0.03,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: "Email"),

                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.02
                            : size.height * 0.01,
                      ),
                      CustomTextField(
                        obsText: false,
                        hinText: "ethan.carter@gmail.com",
                        width: isLandscape ? size.width * 0.6 : double.infinity,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.04 : size.height * 0.03,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: "Bio"),

                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.02
                            : size.height * 0.01,
                      ),
                      Container(
                        height: isLandscape
                            ? size.height * 0.4
                            : size.height * 0.2,
                        width: isLandscape ? size.width * 0.6 : double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.09 : size.height * 0.03,
                ),
                CustomButton(title: "Save Changes"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
