// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            children: [
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
                    'Sign up',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: const Color(0xFF313144),
                    ),
                  ),
                ],
              ),
              SignUpField(
                fieldHeader: 'Email',
                hintTxt: 'example@gmail.com',
                icon: '/Login/blankeye.png',
              ),
              SignUpField(
                fieldHeader: 'Phone Number',
                hintTxt: '+63',
                icon: '/Login/blankeye.png',
              ),
              SignUpField(
                fieldHeader: 'Create a password',
                hintTxt: 'must be 8 characters',
                icon: '/Login/eyeopen.png',
              ),
              SignUpField(
                fieldHeader: 'Confirm password',
                hintTxt: 'repeat password',
                icon: '/Login/eyeopen.png',
              ),
              SizedBox(height: 38),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF007AFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(353, 56), // size
                ),
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 38),
              Row(
                children: [
                  Divider(color: Colors.black),
                ],
              )
            ],
          )),
    );
  }
}

class SignUpField extends StatelessWidget {
  const SignUpField(
      {super.key,
      required this.fieldHeader,
      required this.hintTxt,
      required this.icon});
  final fieldHeader;
  final hintTxt;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14),
        Row(
          children: [
            Text(
              fieldHeader,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: const Color(0xFF313144),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 56,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0XFFD8DADC)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: hintTxt,
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      icon,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
