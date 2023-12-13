// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/sign_up.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/models/account_types.dart';

class SignUpAs extends StatelessWidget {
  const SignUpAs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(36),
              child: Column(children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/WaterWaysIcon.png',
                      width: 140,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Sign up as',
                      style: AppStyles.headline1,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ListView.builder(
                    physics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.normal),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      AccountType account = accountType[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: GestureDetector(
                          child: Container(
                            width: 320,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 3),
                                  blurRadius: 1.0,
                                  spreadRadius: 1.5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    account.customIcon,
                                    height: 75,
                                    width: 75,
                                  ),
                                  Text(account.accTypeLabel,
                                      style: AppStyles.bodyText1.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppStyles
                                              .colorScheme.inversePrimary)),
                                ],
                              ),
                            ),
                          ),
                          onTap: () => navigateToPage(context, index),
                        ),
                      );
                    })
              ]))),
    );
  }
}

void navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
      break;
    default:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
      break;
  }
}
