import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinText;
  final double? width;
  final Widget? prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final bool obsText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hinText,
    this.width,
    this.prefixIcon,
    this.controller,
    required this.obsText,
    this.suffixIcon, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        obscureText: obsText,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldColor,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hint: Text(hinText, style: TextStyle(color: AppColors.hintColor)),
        ),
      ),
    );
  }
}
