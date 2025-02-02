import 'package:get/get.dart';

class DiscoverController extends GetxController{
  RxString selectedFilter='Events'.obs;
  RxString selectedLocationRadius='25'.obs;


  List items=[
    'Restaurants',
    'Events',
    'HiTeas',
    'Deals',
  ];

  List location=[
    '25',
    '50',
    '75',
    '100',
  ];
}