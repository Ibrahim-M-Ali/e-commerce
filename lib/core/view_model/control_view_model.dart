import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/cart_view.dart';
import '../../view/favorite_view.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  Widget _currentScreen = HomeView();

  get currentScreen => _currentScreen;

  void changeSelectedValue(selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = const FavoriteView();
        }
      case 2:
        {
          _currentScreen = const CartView();
        }
      case 3:
        {
          _currentScreen = const ProfileView();
        }
    }
    update();
  }
}
