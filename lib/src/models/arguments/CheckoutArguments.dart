import '../Item.dart';

class CheckoutArguments {
  double totalValue;
  String paymentOption;
  List<Item> items;
  String storeUID;
  String storeName;
  String storeLogoUrl;

  CheckoutArguments(this.totalValue, this.paymentOption, this.items, this.storeUID, this.storeLogoUrl, this.storeName);
}