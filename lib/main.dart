// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waterways/LoadingScreen/loading_screen.dart';
import 'package:waterways/LoginFlow/SignupSuccess.dart';
import 'package:waterways/LoginFlow/login_or_create.dart';
import 'package:waterways/LoginFlow/sign_up.dart';
import 'package:waterways/LoginFlow/sign_up2.dart';
import 'package:waterways/LoginFlow/sign_up_as.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/UserUI/user_main_page.dart';
import 'package:waterways/UserUI/user_notifications_page.dart';
import 'package:waterways/UserUI/user_profile_page.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WaterWays Delivery App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: AppStyles.colorScheme.background,
        body: SafeArea(
          child: LoginOrCreate(),
        ),
      ),
    );
  }
}
