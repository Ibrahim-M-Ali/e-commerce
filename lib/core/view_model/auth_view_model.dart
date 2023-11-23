import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../controller/control_view.dart';
import '../../view/auth/login_screen.dart';
import '../../../../model/user_model.dart';
import '../../view/home_view.dart';
import '../services/firestore_user.dart';
import 'profile_view_model.dart';

class AuthViewModel extends GetxController {
  late String email, password, name;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool obscureText = true;

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(auth.authStateChanges());
  }

  showPassword() {
    obscureText = !obscureText;
    update();
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.offAll(() => LoginScreen());
  }

  void signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          ProfileViewModel().setUser(UserModel.fromJson(value.data()));
        });
      });
      var userModel = UserModel(
          userId: FirebaseAuth.instance.currentUser!.uid,
          email: FirebaseAuth.instance.currentUser!.email!,
          name: FirebaseAuth.instance.currentUser!.displayName!,
          pic: FirebaseAuth.instance.currentUser!.photoURL);

      await FireStoreUser().addUserToFirestore(userModel);

      Get.to(() => ControlView());
    } catch (e) {
      Get.snackbar('Error ', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          ProfileViewModel().setUser(UserModel.fromJson(value.data()));
        });
      });

      Get.to(() => ControlView());
    } catch (e) {
      // print();
      Get.snackbar('Error ', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> createAccountWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var userModel = UserModel(
          userId: FirebaseAuth.instance.currentUser!.uid,
          email: FirebaseAuth.instance.currentUser!.email!,
          name: name,
          pic: '');

      await FireStoreUser().addUserToFirestore(userModel);

      Get.to(() => HomeView());
    } catch (e) {
      Get.snackbar('Error ', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
