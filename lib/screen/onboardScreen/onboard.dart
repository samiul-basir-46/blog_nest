import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/onboard.png",
                width: isLandscape ? size.width * 0.6 : double.infinity,
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "Welcome to Your Personal Blog Space",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'FontMain',
                        fontSize: isLandscape
                            ? size.width * 0.04
                            : size.height * 0.038,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    Text(
                      "Discover articles, save your favorites, and engage with the community.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'FontMain',
                        fontSize: isLandscape
                            ? size.width * 0.018
                            : size.height * 0.02,
                      ),
                    ),
                    SizedBox(
                      height: isLandscape
                          ? size.height * 0.05
                          : size.height * 0.25,
                    ),
                    CustomButton(
                      title: "Get Started",
                      font: 'FontMain',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.login);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
