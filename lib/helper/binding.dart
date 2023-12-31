import 'package:get/get.dart';
import '../core/view_model/cart_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../core/view_model/auth_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.put(ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
