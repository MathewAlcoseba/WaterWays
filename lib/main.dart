// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waterways/LoadingScreen/loading_screen.dart';
import 'package:waterways/LoginFlow/SignupSuccess.dart';
import 'package:waterways/LoginFlow/login.dart';
import 'package:waterways/LoginFlow/login_or_create.dart';
import 'package:waterways/LoginFlow/sign_up.dart';
import 'package:waterways/LoginFlow/sign_up2.dart';
import 'package:waterways/LoginFlow/sign_up_as.dart';
import 'package:waterways/OrderManagement/chat.dart';
import 'package:waterways/OrderManagement/checkout.dart';
import 'package:waterways/OrderManagement/order_details.dart';
import 'package:waterways/OrderManagement/order_status.dart';
import 'package:waterways/OrderManagement/purchase_history.dart';
import 'package:waterways/OrderManagement/store_rating.dart';
import 'package:waterways/OrderManagement/successful_purchase.dart';
import 'package:waterways/StorePage/store_details.dart';
import 'package:waterways/StorePage/store_order_details.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/UserUI/user_main_page.dart';
import 'package:waterways/UserUI/user_notifications_page.dart';
import 'package:waterways/UserUI/user_profile_page.dart';
import 'package:waterways/app_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

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
    imageCache.clear();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WaterWays Delivery App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppStyles.colorScheme.background,
          body: SafeArea(child: UserHomePage()),
        ),
      ),
    );
  }
}
