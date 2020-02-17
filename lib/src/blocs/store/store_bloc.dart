import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:next_toll_veloe/src/models/Item.dart';
import 'package:next_toll_veloe/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc.dart';

class StoreBloc implements Bloc {
  final _repository = Repository();
  final _totalItems = BehaviorSubject<int>();

  Observable<int> get totalItems => _totalItems.stream;

  Function(int) get changeTotalItems => _totalItems.sink.add;

  List<Item> _shoppingCart = List<Item>();
  Set<String> _shoppingCartItemsIds = Set<String>();

  Stream<QuerySnapshot> sotoreProducts(String storeUID) => _repository.storeItemsList(storeUID);
  Future<DocumentSnapshot> storeDocument(String storeUID) => _repository.storeDocument(storeUID);


  void addOrRemoveItemToCart(item) {

    if(_shoppingCartItemsIds.add(item.id)) {
      _shoppingCart.add(item);
    } else {
      _shoppingCartItemsIds.remove(item.id);
      _shoppingCart.remove(item);
    }

    _totalItems.add(_shoppingCart.length);
  }

  bool isShoppingCartEmpty() => _totalItems.value != null ? _totalItems.value <= 0 : true;

  List<Item> getItemsAddedToCart() => _shoppingCart;

  Future<void> checkoutShoppingCartAndMakePurchase(String userUID, String storeUID, String storeName, String storeLogoUrl, List<Item> items, double totalValue, String paymentOption) =>
      _repository.checkoutShoppingCartAndMakePurchase(userUID, storeUID, storeName, storeLogoUrl, items, totalValue, paymentOption);

  void clearItems() {
    _shoppingCart.clear();
    _shoppingCartItemsIds.clear();
    _totalItems.value = 0;
  }

  @override
  void dispose() async {
    await _totalItems.drain();
    _totalItems.close();
  }

}