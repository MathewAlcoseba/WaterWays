import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/bottom_navbar.dart';

void main() {
  runApp(const OrderStatus(
    title: '',
  ));
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            width: 500,
            height: 1100,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    child: header(),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 23,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: left(),
                    ),
                  ),
                ),
                Positioned(
                  top: 35,
                  left: 65,
                  child: Text(
                    'Order Details',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF313144),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                //item card with details

                Stack(
                  children: [
                    Positioned(
                      top: 95,
                      left: 23,
                      child: Text(
                        'Aqua Atlan',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 97,
                      left: 5,
                      child: Container(
                        height: 180,
                        width: 401,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(17.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, // Color of the shadow
                              blurRadius: 5.0, // Spread of the shadow
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 23,
                      child: Container(
                        child: card(),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 200,
                      child: Text(
                        '''Barrel ( 200 Liters )
Delivery
₱12.00
''',
                        style: GoogleFonts.gothicA1(
                          color: Color(0xFF7F8184),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240,
                      right: 25,
                      child: Text(
                        'x3',
                        style: GoogleFonts.gothicA1(
                          color: Color(0xFF7F8184),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                Stack(children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 300,
                        left: 48,
                        child: Container(
                          child: status(),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        left: 40,
                        child: Text(
                          'To Process',
                          style: GoogleFonts.jost(
                            color: Color(0xFF1a1a1a),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        left: 168,
                        child: Text(
                          'On The Way',
                          style: GoogleFonts.jost(
                            color: Color(0xFF1a1a1a),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        right: 58,
                        child: Text(
                          'Rate',
                          style: GoogleFonts.jost(
                            color: Color(0xFF1a1a1a),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  )
                ]),

                //details
                Stack(
                  children: [
                    Positioned(
                      top: 680,
                      left: 15,
                      child: Container(
                        child: clipboard(),
                      ),
                    ),
                    Positioned(
                      top: 680,
                      left: 40,
                      child: Text(
                        'Order Total ( 3 Items )',
                        style: GoogleFonts.jost(
                          color: Color(0xFF1a1a1a),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 470,
                      left: 30,
                      child: Container(
                        height: 1,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Color(0xFF007AFF),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 410,
                      right: 15,
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Color(0xFF66AFFF),
                            borderRadius: BorderRadius.circular(11.0)),
                      ),
                    ),
                    Positioned(
                      top: 418,
                      left: 15,
                      child: Container(
                        child: track(),
                      ),
                    ),
                    Positioned(
                      top: 418,
                      left: 40,
                      child: Text(
                        'View realtime location',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 412,
                      right: 38,
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 490,
                      left: 15,
                      child: Container(
                        child: wallet(),
                      ),
                    ),
                    Positioned(
                      top: 488,
                      left: 40,
                      child: Text(
                        'Payment Option',
                        style: GoogleFonts.jost(
                          color: Color(0xFF1a1a1a),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 520,
                      left: 15,
                      child: Text(
                        'Cash On Delivery',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 560,
                      left: 15,
                      child: Container(
                        child: summary(),
                      ),
                    ),
                    Positioned(
                      top: 560,
                      left: 40,
                      child: Text(
                        'Order Summary',
                        style: GoogleFonts.jost(
                          color: Color(0xFF1a1a1a),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 600,
                      left: 15,
                      child: Text(
                        '''Product Subtotal
Delivery Subtotal
Add-on Subtotal
''',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 600,
                      right: 15,
                      child: Text(
                        '''720
320
150
''',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 730,
                      left: 15,
                      child: Text(
                        'Transaction Code: MYUI7821A-G2-90A',
                        style: GoogleFonts.jost(
                          color: Color(0xFF616161),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 770,
                      right: 20,
                      child: Text(
                        '₱7520.00',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 770,
                      left: 20,
                      child: Text(
                        'Total Payment',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                //nav bar footer

                Stack(
                  children: [
                    Positioned(
                      top: 95,
                      left: 23,
                      child: Text(
                        'Aqua Atlan',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF313144),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget left() => Container(
        child: Image.asset('assets/Main/left.png'),
      );
  Widget track() => Container(
        child: Image.asset('assets/Order/track.png'),
      );
  Widget card() => Container(
        child: Image.asset('assets/Order/AquaAtlanSmall.png'),
      );
  Widget header() => Container(
        child: Image.asset('assets/Order/header.png'),
      );
  Widget wallet() => Container(
        child: Image.asset('assets/Order/wallet.png'),
      );
  Widget status() => Container(
        child: Image.asset('assets/Order/ProgressBar.png'),
      );

  Widget clipboard() => Container(
        child: Image.asset('assets/Order/clipboard.png'),
      );
  Widget summary() => Container(
        child: Image.asset('assets/Order/summary.png'),
      );
}
