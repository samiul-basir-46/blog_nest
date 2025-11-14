import 'package:blog_app/helper/update_api.dart';
import 'package:blog_app/provider/toggle_provider.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/routes.dart';
import '../../../utils/colors.dart';
import '../../../widget/custom_text_field.dart';
import '../../signUpScreen/widget/custom_text.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    oldPass.dispose();
    newPass.dispose();
    confirmPass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final toggleProvider = Provider.of<ToggleProvider>(context);
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
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          obsText: toggleProvider.oldPass,
                          controller: oldPass,
                          hinText: "Enter your current password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleProvider.toggleOldPass();
                            },
                            icon: Icon(
                              toggleProvider.oldPass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                          width: isLandscape
                              ? size.width * 0.6
                              : double.infinity,
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
                          controller: newPass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return "Password must contain at least 1 uppercase letter";
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return "Password must contain at least 1 number";
                            }
                            if (value.length < 8) {
                              return "Password must be 8 characters long";
                            }
                            return null;
                          },
                          obsText: toggleProvider.newPass,
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleProvider.toggleNewPass();
                            },
                            icon: Icon(
                              toggleProvider.newPass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                          hinText: "Enter your new password",
                          width: isLandscape
                              ? size.width * 0.6
                              : double.infinity,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your confirm password";
                            }
                            if (value != newPass.text) {
                              return "Password do not match";
                            }
                            return null;
                          },
                          obsText: toggleProvider.confirmPass,
                          hinText: "Confirm your new password",
                          width: isLandscape
                              ? size.width * 0.6
                              : double.infinity,
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleProvider.toggleConfirmPass();
                            },
                            icon: Icon(
                              toggleProvider.confirmPass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.09
                        : size.height * 0.34,
                  ),
                  updateProvider.isLoading
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : CustomButton(
                          title: "Update Password",
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              final success = await updateProvider.fetchChangePass(
                                oldPass.text,
                                newPass.text
                              );
                              if (success) {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(
                                      child: Text(
                                        "Password Changes Successfully",
                                      ),
                                    ),
                                    backgroundColor: Colors.green,
                                    padding: EdgeInsets.all(15),
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                                Future.delayed(Duration(seconds: 1), () {
                                  if (!context.mounted) return;
                                  // Navigator.pop(context); // যদি আগের screen এ ফিরে যেতে চাও
                                  Navigator.pushReplacementNamed(context, AppRoute.navView[2]);
                                });
                              } else {
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(
                                      child: Text("Password Changes Failed"),
                                    ),
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.all(15),
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
      ),
    );
  }
}
