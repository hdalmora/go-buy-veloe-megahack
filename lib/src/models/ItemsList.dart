import 'package:cloud_firestore/cloud_firestore.dart';

import 'Item.dart';

class ItemsList {
  double totalValue;
  String paymentOption;
  List<Item> items;
  FieldValue timestamp;

  ItemsList(this.totalValue, this.paymentOption, this.items, this.timestamp);

  Map<String, dynamic> toMap() => {
    'totalValue': totalValue,
    'paymentOption': paymentOption,
    'timestamp': timestamp,
    'items': items
  };
}