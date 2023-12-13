import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String? custId;
  final String? email;
  final String? password;
  final String? phone;
  final String? firstname;
  final String? lastname;
  final String? address;
  final String? profileImg;
  final String? coverImg;
  final List<Store>? favorites;
  final List<Order>? orders;

  Customer(
      {this.custId,
      this.email,
      this.password,
      this.phone,
      this.firstname,
      this.lastname,
      this.address,
      this.profileImg,
      this.coverImg,
      this.favorites,
      this.orders});

  Map<String, dynamic> toMap() {
    return {
      'custId': custId,
      'email': email,
      'password': password,
      'phone': phone,
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'profileImg': profileImg,
      'coverImg': coverImg,
      'favorites': favorites?.map((store) => store.toMap()).toList(),
      'orders': orders?.map((order) => order.toMap()).toList(),
    };
  }
}

class Store {
  final String storeId;
  final String email;
  final String password;
  final String phone;
  final String storeName;
  final String storeAddress;
  List<Order>? orders;
  final String profileImg;
  final String coverImg;
  final String storePhoto;
  final String storeCoverPhoto;
  final String storeBio;
  final String storeHours;
  final String storeRating;
  final double waterInStock;
  final double price;
  final bool isAvailable;

  Store(
      {required this.storeId,
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
      this.orders});

  Map<String, dynamic> toMap() {
    return {
      'storeId': storeId,
      'email': email,
      'password': password,
      'phone': phone,
      'storeName': storeName,
      'storeAddress': storeAddress,
      'orders': orders?.map((order) => order.toMap()).toList(),
      'profileImg': profileImg,
      'coverImg': coverImg,
      'storePhoto': storePhoto,
      'storeCoverPhoto': storeCoverPhoto,
      'storeBio': storeBio,
      'storeHours': storeHours,
      'storeRating': storeRating,
      'waterInStock': waterInStock,
      'price': price,
      'isAvailable': isAvailable,
    };
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

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'customerId': customerId,
      'storeId': storeId,
      'timestamp': Timestamp.fromDate(timestamp),
      'deliveryMethod': deliveryMethod,
      'qty': qty,
      'deliveryOption': deliveryOption,
      'deliveryAddress': deliveryAddress,
      'paymentOption': paymentOption,
      'productSubtotal': productSubtotal,
      'deliverySubtotal': deliverySubtotal,
      'totalPayment': totalPayment,
      'status': status,
    };
  }
}
