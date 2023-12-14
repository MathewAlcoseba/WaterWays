// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/forgot_password.dart';
import 'package:waterways/LoginFlow/sign_up.dart';
import 'package:waterways/UserUI/user_main_page.dart';
import 'package:waterways/LoginFlow/sign_up_as.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/firebase_service.dart';
import 'package:waterways/models/users.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    emailController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool get isButtonEnabled {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
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
                        'Log in',
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
                    isEmailField: true,
                    controller: emailController,
                  ),
                  SignUpField(
                    fieldHeader: 'Password',
                    hintTxt: 'enter password',
                    isPasswordField: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()),
                            );
                          },
                          child: Text('Forgot password?')),
                    ],
                  ),
                  SizedBox(
                    height: 38,
                  ),
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
                        ? () async {
                            _onLoginPressed();
                          }
                        : null,
                    child: Text(
                      'Log in',
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
                        'Don\'t have an account? ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: const Color(0xFF313144),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUpAs()),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            color: const Color(0xFF313144),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isLoading)
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: CircularProgressIndicator(
                        color: AppStyles.colorScheme.secondary,
                        backgroundColor:
                            AppStyles.colorScheme.primary.withOpacity(0.5),
                      ),
                    )),
                ],
              )),
        ),
      ),
    );
  }

  void _onLoginPressed() async {
    setState(() => isLoading = true);
    try {
      email = emailController.text.trim();
      password = passwordController.text.trim();

      FirebaseService firebaseService = FirebaseService();
      User? user =
          await firebaseService.signInWithEmailAndPassword(email, password);

      if (user != null) {
        var customerDoc = await FirebaseFirestore.instance
            .collection('Customers')
            .doc(user.uid)
            .get();
        Customer customer = Customer.fromMap(customerDoc.data()!);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserMainPage(
                  customer: customer,
                )));
      } else {
        _showLoginErrorDialog();
      }
    } catch (e) {
      _showLoginErrorDialog();
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showLoginErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid email or password.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class SignUpField extends StatefulWidget {
  final String fieldHeader;
  final String hintTxt;
  final bool isEmailField;
  final bool isPasswordField;
  final TextEditingController controller;

  const SignUpField({
    super.key,
    required this.fieldHeader,
    required this.hintTxt,
    this.isEmailField = false,
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
    if (widget.isEmailField) {
      widget.controller.addListener(() {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    if (widget.isEmailField) {
      widget.controller.removeListener(() {
        if (mounted) setState(() {});
      });
    }
    super.dispose();
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image.asset(
                            _isObscured
                                ? 'assets/Login/eye.png'
                                : 'assets/Login/eyeopen.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                    if (widget.isEmailField &&
                        widget.controller.text.isNotEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/Login/check.png',
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
