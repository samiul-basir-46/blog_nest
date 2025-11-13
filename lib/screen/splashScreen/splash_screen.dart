import 'package:blog_app/helper/auth_api.dart';
import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/provider/onboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardProvider = Provider.of<OnboardProvider>(context);
    final authProvider = Provider.of<AuthApiServices>(context);

    Future.delayed(Duration(seconds: 3), () {
      if (onboardProvider.isFirstTime) {
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, AppRoute.onboard);
      } else if (authProvider.isLoggedIn) {
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, AppRoute.navView);
      } else {
        if (!context.mounted) return;
        Navigator.pushReplacementNamed(context, AppRoute.login);
      }
    });

    return Scaffold(
      body: Center(
        child: Text(
          "Blog Nest",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FontMain',
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
