// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'WaterWaysIcon.png',
          width: 280,
          height: 103,
        ),
      ),
    );
  }
}
