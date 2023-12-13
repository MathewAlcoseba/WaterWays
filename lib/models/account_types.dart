class AccountType {
  final String customIcon;
  final String accTypeLabel;

  AccountType({required this.customIcon, required this.accTypeLabel});
}

var accountType = [
  AccountType(
      customIcon: 'assets/Login/customer.png', accTypeLabel: 'Customer'),
  AccountType(customIcon: 'assets/Login/shop.png', accTypeLabel: 'Store'),
  AccountType(
      customIcon: 'assets/Login/delivery.png', accTypeLabel: 'Delivery'),
];
