// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/sign_up.dart';

class SignUpAs extends StatelessWidget {
  const SignUpAs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Column(children: [
              Row(
                children: [
                  SizedBox(height: 77),
                ],
              ),
              Row(
                children: [
                  ClipRect(
                    child: Align(
                      alignment: Alignment.centerRight,
                      widthFactor: 0.85,
                      child: Image.asset(
                        'assets/WaterWaysIcon.png',
                        height: 80,
                        width: 191,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Sign up as',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: const Color(0xFF313144),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Expanded(
                      child: Container(
                        width: 315,
                        height: 161,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 5),
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/Login/customer.png',
                                height: 58,
                                width: 58,
                              ),
                              Text(
                                'Customer',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  color: const Color(0xFF313144),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 320,
                      height: 161,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 2.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/Login/delivery.png',
                              height: 75,
                              width: 75,
                            ),
                            Text(
                              'Delivery',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: const Color(0xFF313144),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 320,
                      height: 161,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 2.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/Login/shop.png',
                              height: 62,
                              width: 62,
                            ),
                            Text(
                              'Store',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: const Color(0xFF313144),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ])));
  }
}
