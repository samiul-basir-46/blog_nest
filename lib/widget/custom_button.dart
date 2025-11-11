import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final void Function()? onTap;
  final String title;
  final String? font;

  const CustomButton({super.key, this.onTap, required this.title, this.font});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: isLandscape ? size.width * 0.06 : size.height * 0.06,
        width: isLandscape ? size.width * 0.6 : double.infinity,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: isLandscape ? size.width * 0.02 : size.height * 0.02,
              color: Colors.white,
              fontFamily: font
            ),
          ),
        ),
      ),
    );
  }
}
