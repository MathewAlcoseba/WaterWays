import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/OrderManagement/checkout.dart';
import 'package:waterways/bottom-navbar.dart';

void main() {
  runApp(const OrderDetails(
    title: '',
  ));
}

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key, required this.title}) : super(key: key);

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
                  top: 3,
                  left: 0,
                  child: Container(
                    child: logo(),
                  ),
                ),
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
                  top: 143,
                  left: 23,
                  child: Text(
                    'Details',
                    style: GoogleFonts.gothicA1(
                      color: Color(0xFF7F8184),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  top: 175,
                  left: 0,
                  child: Container(
                    height: 1,
                    width: 600,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBEB),
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 20,
                  child: Container(
                    width: 373,
                    height: 273,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/Order/AquaAtlanCard.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 205,
                  right: 25,
                  child: Container(
                    child: dots(),
                  ),
                ),
                Positioned(
                  top: 480,
                  left: 0,
                  child: Container(
                    height: 1,
                    width: 600,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBEB),
                    ),
                  ),
                ),
                Positioned(
                  top: 490,
                  left: 23,
                  child: Text(
                    'Aqua Atlan',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF313144),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  top: 515,
                  left: 23,
                  child: Text(
                    'View profile rating',
                    style: GoogleFonts.gothicA1(
                      color: Color(0xFF7F8184),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  top: 545,
                  left: 0,
                  child: Container(
                    height: 1,
                    width: 600,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBEB),
                    ),
                  ),
                ),
                Positioned(
                  top: 495,
                  right: 10,
                  child: Container(
                    child: right(),
                  ),
                ),
                Positioned(
                  top: 550,
                  left: 23,
                  child: Text(
                    'Product Details:',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF313144),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  top: 590,
                  left: 23,
                  child: Text(
                    '''in stock: 5000 Ltrs
Treated waste water
Undrinkable but usable
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
                  bottom: 20,
                  left: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      _displayBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF007AFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      minimumSize: Size(196.0, 66.0),
                    ),
                    child: Text(
                      "BUY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    child: chat(),
                  ),
                ),
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

                    // Add other widgets on top of or below this stack as needed
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Future<void> _displayBottomSheet(BuildContext context) async {
    bool? checkBox1 = false;
    bool? checkBox2 = false;
    bool? checkBox3 = false;
    bool? checkBox4 = false;

    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 350,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select Options:"),
                  CheckboxListTile(
                    title: Text("Gallon (3 ltrs)"),
                    value: checkBox1 ?? false,
                    onChanged: (value) {
                      setState(() {
                        checkBox1 = value;
                      });
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  CheckboxListTile(
                    title: Text("Barrel (200 ltrs)"),
                    value: checkBox2 ?? false,
                    onChanged: (value) {
                      setState(() {
                        checkBox2 = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  CheckboxListTile(
                    title: Text("ICB Tank (1000 ltrs)"),
                    value: checkBox3 ?? false,
                    onChanged: (value) {
                      setState(() {
                        checkBox3 = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  CheckboxListTile(
                    title: Text("Others"),
                    value: checkBox4 ?? false,
                    onChanged: (value) {
                      setState(() {
                        checkBox4 = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Checkout(
                              title: '',
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF007AFF),
                        minimumSize: Size(146.0, 46.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        "BUY",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget logo() => Container(
        child: Image.asset('assets/WaterWaysIcon.png'),
        height: 118.27,
        width: 152.31,
      );
  Widget header() => Container(
        child: Image.asset('assets/Order/header.png'),
      );

  Widget dots() => Container(
        child: Image.asset('assets/Main/dots.png'),
      );
  Widget home() => Container(
        child: Image.asset('assets/Main/home.png'),
      );
  Widget notifications() => Container(
        child: Image.asset('assets/Main/heart.png'),
      );
  Widget search() => Container(
        child: Image.asset('assets/Main/search.png'),
      );
  Widget profile() => Container(
        child: Image.asset('assets/Main/profile.png'),
      );

  Widget right() => Container(
        child: Image.asset('assets/Main/right.png'),
      );
  Widget chat() => Container(
        child: Image.asset('assets/Main/chat.png'),
      );
}
