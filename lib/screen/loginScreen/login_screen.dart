import 'package:blog_app/helper/auth_api.dart';
import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/provider/toggle_provider.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:blog_app/widget/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
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
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        obsText: false,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          if (!EmailValidator.validate(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                        hinText: 'Email',
                        width: isLandscape ? size.width * 0.6 : double.infinity,
                      ),
                      SizedBox(
                        height: isLandscape
                            ? size.height * 0.07
                            : size.height * 0.03,
                      ),
                      CustomTextField(
                        obsText: toggleProvider.togglePasswordSignIn,
                        hinText: 'Password',
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            toggleProvider.togglePassSignIn();
                          },
                          icon: Icon(
                            toggleProvider.togglePasswordSignIn
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        width: isLandscape ? size.width * 0.6 : double.infinity,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape ? size.height * 0.12 : size.height * 0.08,
                ),
                authProvider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : CustomButton(
                        title: "Sign in",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            final success = await authProvider.loginFetch(
                              emailController.text,
                              passwordController.text,
                            );
                            if (success) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(
                                    child: Text(
                                      "Login Successful",
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
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoute.navView,
                                );
                              });
                            } else {
                              if (!context.mounted) return;
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: Text("Login Failed"),
                                  content: Text("Incorrect email or password"),
                                  actions: [
                                    TextButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("Ok"))
                                  ],
                                );
                              },);
                            }
                          }
                        },
                      ),
                SizedBox(
                  height: isLandscape ? size.height * 0.07 : size.height * 0.35,
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
