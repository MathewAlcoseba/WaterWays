// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/login_or_create.dart';
import 'package:waterways/LoginFlow/sign_up_as.dart';

class SignupSuccess extends StatelessWidget {
  const SignupSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(children: [
          SizedBox(height: 176),
          Image.asset(
            'assets/login/verified.png',
            height: 180,
            width: 430,
          ),
          SizedBox(height: 44),
          Text(
            'Signup Success',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
              color: const Color(0xFF313144),
            ),
          ),
          SizedBox(height: 11),
          Text(
            'Your account has been created successfully',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.normal,
              fontSize: 17.0,
              color: const Color(0xFF313144),
            ),
          ),
          SizedBox(height: 76),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFF007AFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(353, 56),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginOrCreate()),
              );
            },
            child: Text(
              'Login',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
