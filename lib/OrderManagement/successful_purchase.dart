import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/order_status.dart';

void main() {
  runApp(const SuccessfulPurchase(
    title: '',
  ));
}

class SuccessfulPurchase extends StatelessWidget {
  const SuccessfulPurchase({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              color: AppColors.primaryBlue, // Use a defined constant
              width: 500,
              height: 1100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCheckIcon(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildPaymentSuccessfulText(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildViewOrderDetailsText(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildViewOrderDetailsButton(context),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: _buildCloseButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Image.asset('assets/Order/Close.png'),
      ),
    );
  }

  Widget _buildCheckIcon() {
    return Image.asset('assets/Order/checked.png');
  }

  Widget _buildPaymentSuccessfulText() {
    return Text(
      'Payment Successful',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildViewOrderDetailsText() {
    return Text(
      'View Order Details',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildViewOrderDetailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const OrderStatus(
                  title: '',
                )),
      ),
      child: Image.asset('assets/Order/clipboardWhite 1.png'),
    );
  }
}

class AppColors {
  static const Color primaryBlue = Color(0xFF007AFF);
}
