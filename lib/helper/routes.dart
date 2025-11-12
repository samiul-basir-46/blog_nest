import 'package:blog_app/navBarView/nav_bar_view.dart';
import 'package:blog_app/screen/blogDetails/blog_details.dart';
import 'package:blog_app/screen/loginScreen/login_screen.dart';
import 'package:blog_app/screen/navBarScreen/profileScreen/edit_profile_screen.dart';
import 'package:blog_app/screen/navBarScreen/profileScreen/update_password.dart';
import 'package:blog_app/screen/onboardScreen/onboard.dart';
import 'package:blog_app/screen/signUpScreen/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screen/splashScreen/splash_screen.dart';

class AppRoute {
  static const String onboard = '/';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String navView = '/navView';
  static const String blogDetails = '/blogDetails';
  static const String updatePassword = '/updatePassword';
  static const String editProfile = '/editProfile';
  static const String splash = '/splash';

  static Map<String, WidgetBuilder> routes = {
    onboard : (context) => const OnboardScreen(),
    login : (context) => const LoginScreen(),
    signUp : (context) => const SignUpScreen(),
    navView : (context) => NavBarView(),
    blogDetails : (context) => BlogDetails(),
    updatePassword : (context) => UpdatePasswordScreen(),
    editProfile : (context) => EditProfileScreen(),
    splash : (context) => SplashScreen(),
  };

}