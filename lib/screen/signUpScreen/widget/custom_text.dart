import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  const CustomText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: isLandscape ? size.width * 0.02 : size.height * 0.02,
      ),
    );
  }
}
