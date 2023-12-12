import 'dart:ffi';

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
  final Float waterInStock;
  final Float price;
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
  final Float productSubtotal;
  final Float deliverySubtotal;
  final Float totalPayment;
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
}
