// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waterways/LoadingScreen/loading_screen.dart';
import 'package:waterways/LoginFlow/login_create_account.dart';
import 'package:waterways/MainFeed/main_feed.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom-navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WaterWays Delivery App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: AppStyles.colorScheme,
      ),
      home: Scaffold(
        backgroundColor: AppStyles.colorScheme.background,
        body: SafeArea(
          child: MainFeed(),
        ),
      ),
    );
  }
}
