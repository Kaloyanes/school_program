import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  void onDestinationSelected(int value) {
    selectedIndex.value = value;
    HapticFeedback.selectionClick();
  }
}
