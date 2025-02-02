import 'package:get/get.dart';
import 'package:pak_festive/screens/events/event_detail.dart';
import 'package:pak_festive/screens/restaurants/restaurant_detail.dart';
import '../screens/events/all_events.dart';
import '../screens/restaurants/all_restaurants.dart';

class HomeController extends GetxController{

  RxBool isFavourite = false.obs;

  void toggleForFavorite() {
    isFavourite.value = !isFavourite.value;
  }

  viewEventDetail(String title){
    Get.to(()=> EventDetailScreen(title: 'Event Detail',));
  }

  viewRestaurantDetail(String title){
    Get.to(()=> RestaurantDetailScreen(title: 'Restaurant',));
  }

  viewAllEvents(){
    Get.to(()=>const AllEvents());
  }

  viewAllRestaurants(){
    Get.to(()=>const AllRestaurants());
  }

}