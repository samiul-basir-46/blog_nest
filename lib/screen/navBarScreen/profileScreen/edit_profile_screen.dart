import 'package:blog_app/helper/auth_api.dart';
import 'package:blog_app/helper/get_api.dart';
import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/helper/update_api.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../widget/custom_text_field.dart';
import '../../signUpScreen/widget/custom_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final profileProvider = Provider.of<GetPost>(context, listen: false);

    profileProvider.fetchProfile();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final profileProvider = Provider.of<GetPost>(context);
    final updateProvider = Provider.of<UpdateApiServices>(context);

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
                          // image: DecorationImage(
                          //   image: AssetImage("assets/images/avatar.png"),
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.03
                            : size.height * 0.02,
                      ),
                      profileProvider.isLoading
                          ? Column(
                              children: [
                                Text(
                                  ".......",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLandscape
                                        ? size.width * 0.03
                                        : size.height * 0.024,
                                  ),
                                ),
                                Text(
                                  "........@gmail.com",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: isLandscape
                                        ? size.width * 0.02
                                        : size.height * 0.019,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  profileProvider.profile!.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isLandscape
                                        ? size.width * 0.03
                                        : size.height * 0.024,
                                  ),
                                ),
                                Text(
                                  profileProvider.profile!.email,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: isLandscape
                                        ? size.width * 0.02
                                        : size.height * 0.019,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.03 : size.height * 0.02,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                              obsText: false,
                              hinText: "Your name",
                              width: isLandscape
                                  ? size.width * 0.6
                                  : double.infinity,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.04
                            : size.height * 0.03,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: "Phone"),

                            SizedBox(
                              height: isLandscape
                                  ? size.height * 0.02
                                  : size.height * 0.01,
                            ),
                            CustomTextField(
                              obsText: false,
                              hinText: "01.........",
                              controller: phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your phone number";
                                }
                                return null;
                              },
                              width: isLandscape
                                  ? size.width * 0.6
                                  : double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.04 : size.height * 0.03,
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.09 : size.height * 0.03,
                ),
                updateProvider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : CustomButton(
                        title: "Save Changes",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            bool success = await updateProvider.fetchUpdate(
                              nameController.text,
                              phoneController.text,
                            );

                            if (success) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      "Profile successfully updated",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 1),
                                ),
                              );

                              await Future.delayed(Duration(seconds: 1), () {
                                if (!context.mounted) return;
                                Navigator.pop(context);
                              });
                            } else {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      "Profile update failed",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
