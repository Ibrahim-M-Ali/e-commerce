import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
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
      return SizedBox(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.navigatorValue,
          selectedItemColor: primaryColor,
          elevation: 0,
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.explore,
                size: 35,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.shopping_cart,
                size: 35,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person,
                size: 35,
              ),
            ),
          ],
        ),
      );
    },
  );
}
