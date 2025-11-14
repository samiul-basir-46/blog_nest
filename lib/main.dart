import 'dart:io';

import 'package:blog_app/helper/auth_api.dart';
import 'package:blog_app/helper/get_api.dart';
import 'package:blog_app/helper/routes.dart';
import 'package:blog_app/helper/update_api.dart';
import 'package:blog_app/provider/onboard_provider.dart';
import 'package:blog_app/provider/toggle_provider.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardProvider()),
        ChangeNotifierProvider(create: (context) => AuthApiServices()),
        ChangeNotifierProvider(create: (context) => ToggleProvider()),
        ChangeNotifierProvider(create: (context) => GetPost()),
        ChangeNotifierProvider(create: (context) => UpdateApiServices()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: Size(390, 844),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: AppRoute.routes,
      initialRoute: AppRoute.splash,
    ),
  );
}
