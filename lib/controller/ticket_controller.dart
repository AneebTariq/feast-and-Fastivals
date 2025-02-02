import 'package:get/get.dart';

class TicketController extends GetxController{
  var isActiveSelected = true.obs;
  var activeTickets = <String>[].obs;
  var pastTickets = <String>[].obs;

  void onActiveTap() {
    isActiveSelected.value = true;
  }

  void onPastTap() {
    isActiveSelected.value = false;
  }
}