// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/login_or_create.dart';
import 'package:waterways/LoginFlow/sign_up2.dart';
import 'package:waterways/app_styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(_updateButtonState);
    phoneNumberController.addListener(_updateButtonState);
    firstNameController.addListener(_updateButtonState);
    lastNameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {});
  }

  @override
  void dispose() {
    emailController.removeListener(_updateButtonState);
    phoneNumberController.removeListener(_updateButtonState);
    firstNameController.removeListener(_updateButtonState);
    lastNameController.removeListener(_updateButtonState);

    emailController.dispose();
    phoneNumberController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  bool get isButtonEnabled {
    return emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(36),
              child: Column(
                children: [
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
                        'Sign up',
                        style: AppStyles.headline1,
                      ),
                    ],
                  ),
                  SignUpField(
                    fieldHeader: 'Email',
                    hintTxt: 'example@gmail.com',
                    controller: emailController,
                  ),
                  SignUpField(
                    fieldHeader: 'Phone Number',
                    hintTxt: 'Enter 11-digit number',
                    isPhoneNumberField: true,
                    controller: phoneNumberController,
                  ),
                  SignUpField(
                    fieldHeader: 'First Name',
                    hintTxt: 'Enter first name',
                    controller: firstNameController,
                  ),
                  SignUpField(
                    fieldHeader: 'Last Name',
                    hintTxt: 'Enter last name',
                    controller: lastNameController,
                  ),
                  SizedBox(height: 38),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF313144),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(10, 50),
                    ),
                    onPressed: isButtonEnabled
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignUp2()),
                            );
                          }
                        : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Next',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 20.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 72),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: const Color(0xFF313144),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginOrCreate()),
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
    this.isPhoneNumberField = false,
  });
  final fieldHeader;
  final hintTxt;
  final TextEditingController controller;
  final bool isPhoneNumberField;

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
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0XFFD8DADC)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        keyboardType: isPhoneNumberField
                            ? TextInputType.phone
                            : TextInputType.text,
                        inputFormatters: isPhoneNumberField
                            ? [FilteringTextInputFormatter.digitsOnly]
                            : [],
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
