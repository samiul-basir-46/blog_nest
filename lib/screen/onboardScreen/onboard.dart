import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/provider/onboard_provider.dart';
import 'package:blog_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final onboardProvider = Provider.of<OnboardProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/onboard.png",
                width: isLandscape ? size.width * 0.6 : double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://img.icons8.com/?size=50&id=j1UxMbqzPi7n&format=png",
                    color: Colors.white,
                    width: isLandscape ? size.width * 0.6 : double.infinity,
                  );
                },
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
                        onboardProvider.onboardComplete();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoute.login,
                          (route) => false,
                        );
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
