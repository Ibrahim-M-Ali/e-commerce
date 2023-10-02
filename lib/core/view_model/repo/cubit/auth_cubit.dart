import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:operations/core/services/firestore_user.dart';
import 'package:operations/model/user_model.dart';
import '../../../../view/home_view.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  late String email, password, name;
  FirebaseAuth auth = FirebaseAuth.instance;

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

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(AuthAuthenticated());
      Get.to(const HomeView());
    } catch (e) {
      emit(AuthError(e.toString()));
      Get.snackbar('Error ', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(AuthAuthenticated());
      Get.to(const HomeView());
    } catch (e) {
      emit(AuthError(e.toString()));
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
      UserModel userModel = UserModel(
          userId: FirebaseAuth.instance.currentUser!.uid,
          email: FirebaseAuth.instance.currentUser!.email!,
          name: name,
          pic: '');
      await FireStoreUser().addUserToFirestore(userModel);
      emit(AuthAuthenticated());
      Get.to(const HomeView());
    } catch (e) {
      emit(AuthError(e.toString()));
      Get.snackbar('Error ', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
