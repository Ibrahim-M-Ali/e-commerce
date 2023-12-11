import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';
import '../view/auth/login_screen.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthViewModel>().user == null)
            ? LoginScreen()
            : GetBuilder<ControlViewModel>(
                init: ControlViewModel(),
                builder: (controller) {
                  return Scaffold(
                    body: controller.currentScreen,
                    bottomNavigationBar: BottomNavBar(),
                  );
                },
              );
      },
    );
  }
}

Widget BottomNavBar() {
  return GetBuilder<ControlViewModel>(
    init: ControlViewModel(),
    builder: (controller) {
      return CurvedNavigationBar(
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        height: 65,
        backgroundColor: Color(0xFF3B3B3B),
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Color(0xFF3B3B3B),
          ),
          Icon(
            Icons.message,
            color: Color(0xFF3B3B3B),
            size: 30,
          ),
          Icon(
            Icons.shopping_bag,
            color: Color(0xFF3B3B3B),
            size: 30,
          ),
          Icon(
            Icons.person_rounded,
            color: Color(0xFF3B3B3B),
            size: 30,
          ),
        ],
      );
    },
  );
}
