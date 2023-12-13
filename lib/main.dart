// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:waterways/LoadingScreen/loading_screen.dart';
import 'package:waterways/LoginFlow/login_create_account.dart';
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
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom_navbar.dart';

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
      ),
      home: Scaffold(
        backgroundColor: AppStyles.colorScheme.background,
        body: SafeArea(
          child: StoreDetails(
            title: '',
          ),
        ),
      ),
    );
  }
}
