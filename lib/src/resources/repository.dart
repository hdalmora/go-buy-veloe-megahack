import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:next_toll_veloe/src/models/Item.dart';
import 'authentication_resources.dart';
import 'firestore_resources.dart';

class Repository {
  final _authResources = AuthenticationResources();
  final _firestoreResources = FirestoreResources();

  /// Authentication
  Stream<FirebaseUser> get onAuthStateChange => _authResources.onAuthStateChange;
  Future<void> signInWithGoogle() => _authResources.signWithGoogle();
  Future<int> loginWithEmailAndPassword(String email, String password) => _authResources.loginWithEmailAndPassword(email, password);
  Future<int> signUpWithEmailAndPassword(String email, String password, String displayName) => _authResources.signUpWithEmailAndPassword(email, password, displayName);
  Future<void> signOut() => _authResources.signOut;
  Future<String> getUserUID() => _authResources.getUserUID();

  /// Firestore
  Stream<QuerySnapshot> purchasesList(String userUID) => _firestoreResources.purchasesList(userUID);
  Stream<QuerySnapshot> lastPurchase(String userUID) => _firestoreResources.lastPurchase(userUID);
  Future<DocumentSnapshot> storeDocument(String storeUID) => _firestoreResources.storeDocument(storeUID);
  Stream<QuerySnapshot> storeItemsList(String storeUID) => _firestoreResources.storeItemsList(storeUID);
  Future<void> checkoutShoppingCartAndMakePurchase(String userUID, String storeUID, String storeName, String storeLogoUrl, List<Item> items, double totalValue, String paymentOption) =>
      _firestoreResources.checkoutShoppingCartAndMakePurchase(userUID, storeUID, storeName, storeLogoUrl, items, totalValue, paymentOption);


  }