import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:next_toll_veloe/src/resources/repository.dart';

import '../bloc.dart';

class UserBloc implements Bloc {
  final _repository = Repository();

  Future<String> getUserUID() => _repository.getUserUID();
  Stream<QuerySnapshot> purchasesList(String userUID) => _repository.purchasesList(userUID);
  Future<DocumentSnapshot> checkInStore(String barCode) => _repository.checkForStoreBarCode(barCode);

  Future<void> logOut() => _repository.signOut();

  @override
  void dispose() {
  }

}