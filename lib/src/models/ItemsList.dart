import 'package:cloud_firestore/cloud_firestore.dart';

import 'Item.dart';

class ItemsList {
  double totalValue;
  String paymentOption;
  List<Item> items;
  FieldValue timestamp;
  String storeUID;
  String storeName;
  String storeLogoUrl;

  ItemsList(this.totalValue, this.storeUID, this.storeName, this.storeLogoUrl, this.paymentOption, this.items, this.timestamp);

  Map<String, dynamic> toMap() => {
    'totalValue': totalValue,
    'paymentOption': paymentOption,
    'storeUID': storeUID,
    'storeName': storeName,
    'storeLogoUrl': storeLogoUrl,
    'timestamp': timestamp,
    'items': items
  };
}