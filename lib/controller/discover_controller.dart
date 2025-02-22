import 'package:get/get.dart';

import '../screens/events/event_detail.dart';
import '../screens/restaurants/restaurant_detail.dart';

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
  viewEventDetail(String title){
    Get.to(()=> EventDetailScreen(title: 'Event Detail',));
  }

  viewRestaurantDetail(String title){
    Get.to(()=> RestaurantDetailScreen(title: 'Restaurant',));
  }

}