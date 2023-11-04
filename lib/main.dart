// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waterways/LoadingScreen/loading_screen.dart';
import 'package:waterways/LoginFlow/login_create_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaterWays',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: SafeArea(
          child: LoginOrCreate(),
        ),
      ),
    );
  }
}
