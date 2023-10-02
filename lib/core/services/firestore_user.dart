import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:operations/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    try {
      return _users.doc(userModel.userId).set(userModel.toJson());
    } catch (e) {
      print(
          'Erroraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaانا اهووووووووو adding user to Firestore: $e');
    }
  }
}
