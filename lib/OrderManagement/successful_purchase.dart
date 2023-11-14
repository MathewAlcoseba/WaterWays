import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/purchase_history.dart';

void main() {
  runApp(const SuccessfulPurchase(
    title: '',
  ));
}

class SuccessfulPurchase extends StatelessWidget {
  const SuccessfulPurchase({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xFF007AFF), // Set the background color to blue
          width: 500,
          height: 1100,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 40,
                right: 23,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: close(),
                  ),
                ),
              ),
              Positioned(
                top: 450,
                left: 23,
                child: Text(
                  'Payment Successful',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFFFFFFF),
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 140,
                child: Container(
                  child: check(),
                ),
              ),
              Positioned(
                top: 440,
                left: 0,
                child: SizedBox(
                  width: 410,
                  height: 510,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PurchaseHistory(title: 'Your Title'),
                        ),
                      );
                    },
                    child: Container(
                      child: clipboard(),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 650,
                left: 121,
                child: Text(
                  'view past transactions',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget close() => Container(
        child: Image.asset('assets/Order/Close.png'),
      );
  Widget check() => Container(
        child: Image.asset('assets/Order/checked.png'),
      );
  Widget clipboard() => Container(
        child: Image.asset('assets/Order/clipboardWhite 1.png'),
      );
}
