import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinText;
  final double? width;
  final Widget? prefixIcon;
  const CustomTextField({super.key, required this.hinText, this.width, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldColor,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hint: Text(hinText, style: TextStyle(color: AppColors.hintColor)),
        ),
      ),
    );
  }
}
