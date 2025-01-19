import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/discover_screens/discover_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/notification/notifications.dart';
import '../screens/settings/setting_screen.dart';

class BottomBarController extends GetxController {
  RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void setIndex(int index) {
    _selectedIndex.value = index;
  }

  // List of pages to display based on the selected index
  final List<Widget> pages = [
    HomeScreen(),
    const DiscoverScreen(),
    const NotificationsScreen(),
    const SettingScreen(),
  ];
}
