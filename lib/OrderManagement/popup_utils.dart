// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// void updateSelectedOptions() {
//     List<String> selectedOptions = [];
//     if (checkboxValue1) selectedOptions.add('Gallon');
//     if (checkboxValue2) selectedOptions.add('Barrel');
//     if (checkboxValue3) selectedOptions.add('ICB Tank');

//     selectedOption = selectedOptions.join(', ');

//     deliveryMethod = radioValue == 1 ? 'Delivery' : 'Pick-Up';
//   }

//   void showCupertinoPopup(BuildContext context) {
    
//     final double pricePerGallon = 25.0;
//     final double pricePerBarrel = 300.0;
//     final double pricePerICBTank = 1000.0;
//     final double radioOption1Price = 25.0;
//     final double radioOption2Price = 0.0;

//     double calculateTotalPrice() {
//       double totalPrice = 0.0;
//       if (checkboxValue1) totalPrice += pricePerGallon;
//       if (checkboxValue2) totalPrice += pricePerBarrel;
//       if (checkboxValue3) totalPrice += pricePerICBTank;
//       if (radioValue == 1) totalPrice += radioOption1Price;
//       if (radioValue == 2) totalPrice += radioOption2Price;
//       return totalPrice * counter;
//     }

//     showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return CupertinoPopupSurface(
//           child: Material(
//             child: Container(
//               padding: EdgeInsets.only(top: 15, left: 5),
//               height: MediaQuery.of(context).size.height * 0.45,
//               child: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//                   return Column(children: [
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: CheckboxListTile(
//                                   title: Text('Gallon'),
//                                   value: checkboxValue1,
//                                   onChanged: (bool? newValue) {
//                                     setState(() {
//                                       checkboxValue1 = newValue!;
//                                     });
//                                   },
//                                   controlAffinity:
//                                       ListTileControlAffinity.leading,
//                                   activeColor: Color(0XFF007AFF),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: RadioListTile<int>(
//                                   title: const Text('Delivery'),
//                                   value: 1,
//                                   groupValue: radioValue,
//                                   onChanged: (int? newValue) {
//                                     setState(() {
//                                       radioValue = newValue!;
//                                     });
//                                   },
//                                   activeColor: Color(0XFF007AFF),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: CheckboxListTile(
//                                   title: Text('Barrel'),
//                                   value: checkboxValue2,
//                                   onChanged: (bool? newValue) {
//                                     setState(() {
//                                       checkboxValue2 = newValue!;
//                                     });
//                                   },
//                                   controlAffinity:
//                                       ListTileControlAffinity.leading,
//                                   activeColor: Color(0XFF007AFF),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: RadioListTile<int>(
//                                   title: const Text('Pick-Up'),
//                                   value: 2,
//                                   groupValue: radioValue,
//                                   onChanged: (int? newValue) {
//                                     setState(() {
//                                       radioValue = newValue!;
//                                     });
//                                   },
//                                   activeColor: Color(0XFF007AFF),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: CheckboxListTile(
//                                   title: Text('ICB Tank'),
//                                   value: checkboxValue3,
//                                   onChanged: (bool? newValue) {
//                                     setState(() {
//                                       checkboxValue3 = newValue!;
//                                     });
//                                   },
//                                   controlAffinity:
//                                       ListTileControlAffinity.leading,
//                                   activeColor: Color(0XFF007AFF),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 25),
//                                 child: Container(
//                                   width: 195,
//                                   child: Expanded(
//                                     child: Text(
//                                       "Disclaimer: The container used to deliver the water is provided solely for transportation and measurement reference.",
//                                       style: AppStyles.bodyText5,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 20, top: 40),
//                                 child: Text(
//                                   'Total Price: \n₱${calculateTotalPrice().toStringAsFixed(2)}',
//                                   style: AppStyles.bodyText6,
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     right: 10,
//                                     left:
//                                         20), // Add right margin to the first container
//                                 decoration: BoxDecoration(
//                                   color: Color(
//                                       0XFF007AFF), // Set the color of the circle
//                                   shape: BoxShape.circle, // Make it circular
//                                 ),
//                                 child: IconButton(
//                                   icon: const Icon(Icons.remove,
//                                       color: Colors
//                                           .white), // Set icon color to white
//                                   onPressed: () {
//                                     setState(() {
//                                       if (counter > 0) counter--;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal:
//                                         8), // Add horizontal padding to the text
//                                 child: Text('$counter',
//                                     style: const TextStyle(fontSize: 20)),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     left:
//                                         10), // Add left margin to the second container
//                                 decoration: BoxDecoration(
//                                   color: Color(
//                                       0XFF007AFF), // Set the color of the circle
//                                   shape: BoxShape.circle, // Make it circular
//                                 ),
//                                 child: IconButton(
//                                   icon: const Icon(Icons.add,
//                                       color: Colors
//                                           .white), // Set icon color to white
//                                   onPressed: () {
//                                     setState(() {
//                                       counter++;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 90,
//                               ),
//                               Container(
//                                 width: 146,
//                                 height: 42,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     // Update selected options
//                                     updateSelectedOptions();

//                                     // Calculate total price
//                                     double totalPrice = calculateTotalPrice();

//                                     // Navigate to Checkout page with updated values
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Checkout(
//                                           title: 'Checkout',
//                                           showCupertinoPopupCallback: () =>
//                                               showCupertinoPopup(context),
//                                           selectedOptions: selectedOption,
//                                           deliveryMethod: deliveryMethod,
//                                           totalPrice: totalPrice,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text('BUY',
//                                       style: TextStyle(fontSize: 20)),
//                                   style: ElevatedButton.styleFrom(
//                                     primary: const Color(0XFF007AFF),
//                                     onPrimary: Colors.white,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ]);
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }