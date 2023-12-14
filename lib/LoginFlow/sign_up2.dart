import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/LoginFlow/login.dart';
import 'package:waterways/LoginFlow/sign_up_success.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/firebase_service.dart';
import 'package:waterways/models/users.dart';

class SignUp2 extends StatefulWidget {
  final Customer customer;

  const SignUp2({super.key, required this.customer});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? email;
  String address = '';
  String password = '';
  String confirmPassword = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    email = widget.customer.email;
    addressController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
    confirmPasswordController.addListener(_updateButtonState);
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

  Customer updateCustomerData(String address, String password, String custId) {
    return Customer(
        custId: custId,
        email: widget.customer.email,
        password: password,
        phone: widget.customer.phone,
        firstname: widget.customer.firstname,
        lastname: widget.customer.lastname,
        address: address,
        profileImg:
            'https://firebasestorage.googleapis.com/v0/b/waterways-7c3c8.appspot.com/o/profile-placeholder.png?alt=media&token=94a74998-1280-4007-9b13-15f442a1845a',
        coverImg:
            'https://firebasestorage.googleapis.com/v0/b/waterways-7c3c8.appspot.com/o/coverphoto-placeholder.png?alt=media&token=2ede18bf-b68e-478e-8605-fccedfc9100e',
        favorites: [],
        orders: []);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(height: 77),
                      ],
                    ),
                    Row(
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
                      ],
                    ),
                    const SizedBox(height: 12),
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
                      hintTxt: 'confirm password',
                      isPasswordField: true,
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 143),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF007AFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(353, 50),
                      ),
                      onPressed: isButtonEnabled ? _onSignUpPressed : null,
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 72),
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
                                  builder: (context) => const Login()),
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
                ),
              ),
            ),
            if (isLoading)
              Center(
                  child: CircularProgressIndicator(
                color: AppStyles.colorScheme.secondary,
                backgroundColor: AppStyles.colorScheme.primary.withOpacity(0.5),
              )),
          ],
        ),
      ),
    );
  }

  void _updateButtonState() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onSignUpPressed() async {
    setState(() => isLoading = true);
    try {
      address = addressController.text.trim();
      password = passwordController.text.trim();
      confirmPassword = confirmPasswordController.text.trim();
      if (password == confirmPassword) {
        User? user = await FirebaseService()
            .signUpWithEmailAndPassword(email!, password);
        if (user != null) {
          Customer customerData =
              updateCustomerData(address, password, user.uid);

          await FirebaseService().storeCustomerData(user, customerData.toMap());
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignupSuccess()));
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Password Mismatch'),
              content: const Text(
                  'The passwords entered do not match. Please try again.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      _showErrorDialog(context, "Error signing up!");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
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
        const SizedBox(height: 14),
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
