import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String custId;
  final String email;
  final String password;
  final String phone;
  final String firstname;
  final String lastname;
  final String address;
  final String profileImg;
  final String coverImg;
  List<Store>? favorites;
  List<Order>? orders;

  Customer(
      {required this.custId,
      required this.email,
      required this.password,
      required this.phone,
      required this.firstname,
      required this.lastname,
      required this.address,
      required this.profileImg,
      required this.coverImg,
      this.favorites,
      this.orders});
}

class Store {
  late String storeId;
  late String email;
  late String password;
  late String phone;
  late String storeName;
  late String storeAddress;
  late List<Order>? orders;
  late String profileImg;
  late String coverImg;
  late String storePhoto;
  late String storeCoverPhoto;
  late String storeBio;
  late String storeHours;
  late int storeRating;
  late double waterInStock;
  late double price;
  late bool isAvailable;

  Store({
    required this.storeId,
    required this.email,
    required this.password,
    required this.phone,
    required this.storeName,
    required this.storeAddress,
    required this.profileImg,
    required this.coverImg,
    required this.storePhoto,
    required this.storeCoverPhoto,
    required this.storeBio,
    required this.storeHours,
    required this.storeRating,
    required this.waterInStock,
    required this.price,
    required this.isAvailable,
    this.orders,
  });

  Store.fromMap(Map<String, dynamic> map) {
    print("Parsing store: $map");
    storeId = map['storeId'] ?? '';
    email = map['email'] ?? '';
    password = map['password'] ?? '';
    phone = map['phone'] ?? '';
    storeName = map['storeName'] ?? '';
    storeAddress = map['storeAddress'] ?? '';
    profileImg = map['profileImg'] ?? '';
    coverImg = map['coverImg'] ?? '';
    storePhoto = map['storePhoto'] ?? '';
    storeCoverPhoto = map['storeCoverPhoto'] ?? '';
    storeBio = map['storeBio'] ?? '';
    storeHours = map['storeHours'] ?? '';
    storeRating = map['storeRating'] ?? '';
    waterInStock = map['waterInStock']?.toDouble() ?? 0.0;
    price = map['price']?.toDouble() ?? 0.0;
    isAvailable = map['isAvailable'] ?? false;

    if (map['orders'] != null) {
      orders = List<Order>.from(
          map['orders'].map((orderMap) => Order.fromMap(orderMap)));
    }
  }
}

class Order {
  final String orderId;
  final String customerId;
  final String storeId;
  final DateTime timestamp;
  final String deliveryMethod;
  final int qty;
  final String deliveryOption;
  final String deliveryAddress;
  final String paymentOption;
  final double productSubtotal;
  final double deliverySubtotal;
  final double totalPayment;
  final bool status;

  Order(
      {required this.orderId,
      required this.customerId,
      required this.storeId,
      required this.timestamp,
      required this.deliveryMethod,
      required this.qty,
      required this.deliveryOption,
      required this.deliveryAddress,
      required this.paymentOption,
      required this.productSubtotal,
      required this.deliverySubtotal,
      required this.totalPayment,
      required this.status});
  Order.fromMap(Map<String, dynamic> map)
      : orderId = map['orderId'],
        customerId = map['customerId'],
        storeId = map['storeId'],
        timestamp = (map['timestamp'] as Timestamp).toDate(),
        deliveryMethod = map['deliveryMethod'],
        qty = map['qty'],
        deliveryOption = map['deliveryOption'],
        deliveryAddress = map['deliveryAddress'],
        paymentOption = map['paymentOption'],
        productSubtotal = map['productSubtotal'].toDouble(),
        deliverySubtotal = map['deliverySubtotal'].toDouble(),
        totalPayment = map['totalPayment'].toDouble(),
        status = map['status'];
}
