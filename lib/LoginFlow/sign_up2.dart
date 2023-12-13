// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/login.dart';
import 'package:waterways/LoginFlow/sign_up_success.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    addressController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    addressController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    confirmPasswordController.removeListener(_updateButtonState);

    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool get isButtonEnabled {
    return addressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
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
                    children: const [
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
                    fieldHeader: 'Address',
                    hintTxt: 'enter address',
                    controller: addressController,
                  ),
                  SignUpField(
                    fieldHeader: 'Create a password',
                    hintTxt: 'must be 8 characters',
                    isPasswordField: true,
                    controller: passwordController,
                  ),
                  SignUpField(
                    fieldHeader: 'Confirm password',
                    hintTxt: 'repeat password',
                    isPasswordField: true,
                    controller: confirmPasswordController,
                  ),
                  SizedBox(height: 143),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF007AFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(353, 50),
                    ),
                    onPressed: isButtonEnabled
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignupSuccess()),
                            );
                          }
                        : null,
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
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

class SignUpField extends StatefulWidget {
  final String fieldHeader;
  final String hintTxt;
  final bool isPasswordField;
  final TextEditingController controller;

  const SignUpField({
    super.key,
    required this.fieldHeader,
    required this.hintTxt,
    this.isPasswordField = false,
    required this.controller,
  });

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14),
        Row(
          children: [
            Text(
              widget.fieldHeader,
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
                        controller: widget.controller,
                        obscureText: widget.isPasswordField && _isObscured,
                        decoration: InputDecoration(
                          hintText: widget.hintTxt,
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (widget.isPasswordField) ...[
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        child: Image.asset(
                          _isObscured
                              ? 'assets/Login/eye.png'
                              : 'assets/Login/eyeopen.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
