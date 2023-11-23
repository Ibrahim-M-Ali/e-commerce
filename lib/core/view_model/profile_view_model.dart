import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../../model/user_model.dart';

class ProfileViewModel extends GetxController {
  var usersBox = Hive.box<UserModel>('users_box');

  ProfileViewModel() {
    getCurrentUser();
  }

  List<UserModel>? _usersList;

  List<UserModel>? get usersList => _usersList;

  getCurrentUser() {
    _usersList = usersBox.values.toList();

    update();
  }

  setUser(UserModel user) {
    usersBox.add(user);
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    usersBox.clear();
  }
}
