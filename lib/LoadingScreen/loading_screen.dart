// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waterways/LoginFlow/login_or_create.dart';
import 'package:get/get.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(() => LoginOrCreate());
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/WaterWaysIcon.png',
          width: 280,
          height: 103,
        ),
      ),
    );
  }
}
