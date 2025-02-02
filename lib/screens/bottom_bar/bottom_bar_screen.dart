import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:pak_festive/controller/bottom_bar_controller.dart';
import '../../utils/app_colors.dart';

class BottomBarScreen extends StatelessWidget {
  final BottomBarController controller = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => controller.pages[controller.selectedIndex]),
      bottomNavigationBar: Obx(
            () => CrystalNavigationBar(
          currentIndex: controller.selectedIndex,
          unselectedItemColor: kcWhiteColor,
          selectedItemColor: kcSecondary,
          backgroundColor: Colors.black.withOpacity(0.2),
          onTap: (index) => controller.setIndex(index),
          items: [
            CrystalNavigationBarItem(icon: Icons.house),
            CrystalNavigationBarItem(icon: Icons.search_rounded),
            CrystalNavigationBarItem(icon: Icons.notifications_active),
            CrystalNavigationBarItem(icon: Icons.settings_suggest),
          ],
        ),
      ),
    );
  }
}
