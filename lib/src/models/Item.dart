import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String storeUID;
  String itemImageUrl;
  String itemName;
  String itemDescription;
  double itemPrice;
  Timestamp timestamp;

  Item({this.id, this.storeUID, this.itemImageUrl, this.itemName, this.itemDescription, this.itemPrice, this.timestamp});

  Map<String, dynamic> toMap() => {
    'id': id,
    'storeUID': storeUID,
    'itemImageUrl': itemImageUrl,
    'itemName': itemName,
    'itemDescription': itemDescription,
    'itemPrice': itemPrice,
    'timestamp': timestamp
  };

  factory Item.fromDocument(DocumentSnapshot document) {
    return Item(
      id: document.documentID,
      storeUID: document['storeUID'],
      itemImageUrl: document['itemImageUrl'],
      itemName: document['itemName'],
      itemDescription: document['itemDescription'],
      itemPrice: document['itemPrice'],
      timestamp: document['timestamp'],
    );
  }
}