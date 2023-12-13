// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waterways/LoginFlow/login.dart';
import 'package:waterways/LoginFlow/login_or_create.dart';
import 'package:waterways/LoginFlow/sign_up.dart';
import 'package:waterways/LoginFlow/sign_up2.dart';
import 'package:waterways/LoginFlow/sign_up_as.dart';
import 'package:waterways/LoadingScreen/loading_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return GetMaterialApp(
      title: 'WaterWays',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffF8F8F8),
          body: SafeArea(
            child: LoadingScreen(),
          ),
        ),
      ),
    );
  }
}
