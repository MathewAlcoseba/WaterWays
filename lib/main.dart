// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waterways/LoadingScreen/loading_screen.dart';
import 'package:get/get.dart';
import 'package:waterways/app_styles.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBmBMaNg_9-l8fZpWkyQF2OBaVojolr0js",
          appId: "1:704742160478:android:6baad1a16273790167dccf",
          messagingSenderId: "704742160478",
          projectId: "waterways-7c3c8"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WaterWays Delivery App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppStyles.colorScheme.background,
          body: SafeArea(
            child: LoadingScreen(),
          ),
        ),
      ),
    );
  }
}
