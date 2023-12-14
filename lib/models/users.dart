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

  Customer.fromMap(Map<String, dynamic> map)
      : custId = map['custId'] ?? '',
        email = map['email'] ?? '',
        password = map['password'] ?? '',
        phone = map['phone'] ?? '',
        firstname = map['firstname'] ?? '',
        lastname = map['lastname'] ?? '',
        address = map['address'] ?? '',
        profileImg = map['profileImg'] ?? '',
        coverImg = map['coverImg'] ?? '',
        favorites = map['favorites'] != null
            ? List<Store>.from(map['favorites'].map((x) => Store.fromMap(x)))
            : null,
        orders = map['orders'] != null
            ? List<Order>.from(map['orders'].map((x) => Order.fromMap(x)))
            : null;
}

class Store {
<<<<<<< HEAD
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
=======
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
  late String storeFeedMiniPhoto;
  late String storeBio;
  late String storeHours;
  late int storeRating;
  late double waterInStock;
  late double price;
  late bool isAvailable;
>>>>>>> b7e9ba4ab7ba2ecd82e2dbd23a81187d68c88232

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
    required this.storeFeedMiniPhoto,
    required this.storeBio,
    required this.storeHours,
    required this.storeRating,
    required this.waterInStock,
    required this.price,
    required this.isAvailable,
    this.orders,
  });

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
    storeFeedMiniPhoto = map['storeFeedMiniPhoto'] ?? '';
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
