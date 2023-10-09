import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';

class FireStoreUser {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    try {
      return _users.doc(userModel.userId).set(userModel.toJson());
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }
}
