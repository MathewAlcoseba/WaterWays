// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  void dispose() {
    emailController.removeListener(_updateButtonState);

    emailController.dispose();
    super.dispose();
  }

  bool get isButtonEnabled {
    return emailController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 135),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: const Color(0xFF313144),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Don’t worry! It happens. Please enter the email associated with your account.',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            color: const Color(0xFF313144),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SignUpField(
                    fieldHeader: 'Email',
                    hintTxt: 'Enter your email address',
                    controller: emailController,
                    isEmailField: true,
                  ),
                  SizedBox(height: 38),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF007AFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(353, 50),
                    ),
                    onPressed: isButtonEnabled ? () {} : null,
                    child: Text(
                      'Send Code',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 135),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Remember Password? ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: const Color(0xFF313144),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Log in',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            color: const Color(0xFF313144),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class SignUpField extends StatelessWidget {
  const SignUpField({
    super.key,
    required this.fieldHeader,
    required this.hintTxt,
    required this.controller,
    this.isEmailField = false,
  });

  final String fieldHeader;
  final String hintTxt;
  final TextEditingController controller;
  final bool isEmailField;

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
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0XFFD8DADC)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
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
                    if (isEmailField && controller.text.isNotEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/Login/check.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                    SizedBox(width: 10),
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
