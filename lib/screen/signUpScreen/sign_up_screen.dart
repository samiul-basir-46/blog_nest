import 'package:blog_app/helper/auth_api.dart';
import 'package:blog_app/provider/toggle_provider.dart';
import 'package:blog_app/screen/signUpScreen/widget/custom_text.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:blog_app/widget/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);
    final authProvider = Provider.of<AuthApiServices>(context);

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
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          obsText: false,
                          controller: nameController,
                          hinText: "username",
                          width: isLandscape
                              ? size.width * 0.6
                              : double.infinity,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }
                            if (!EmailValidator.validate(value.trim())) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          obsText: false,
                          hinText: "email",
                          controller: emailController,
                          width: isLandscape
                              ? size.width * 0.6
                              : double.infinity,
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
                          obsText: false,
                          hinText: "Phone",
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your phone";
                            }
                            return null;
                          },
                          width: isLandscape
                              ? size.width * 0.6
                              : double.infinity,
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
                          obsText: toggleProvider.togglePassword,
                          hinText: "Password",
                          controller: passwordController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleProvider.togglePass();
                            },
                            icon: Icon(
                              toggleProvider.togglePassword
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
                            if (value != passwordController.text) {
                              return "Password do not match";
                            }
                            return null;
                          },
                          controller: confirmPassController,
                          obsText: toggleProvider.togglePassword2,
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleProvider.togglePass2();
                            },
                            icon: Icon(
                              toggleProvider.togglePassword2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                          hinText: "Confirm Password",
                          width: isLandscape
                              ? size.width * 0.6
                              : double.infinity,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: isLandscape
                        ? size.height * 0.06
                        : size.height * 0.05,
                  ),
                  authProvider.isLoading
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : CustomButton(
                          title: "Register",
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await authProvider.regFetch(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                phoneController.text,
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(child: Text("Account Created")),
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.all(15),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              Navigator.pushReplacementNamed(context, AppRoute.login);
                            }
                          },
                        ),
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
