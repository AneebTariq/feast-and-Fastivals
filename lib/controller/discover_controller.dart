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

  List images=[
    'https://www.eventsindustryforum.co.uk/images/articles/about_the_eif.jpg',
    'https://cdn.earlytorise.com/wp-content/uploads/2008/02/event-promotion.jpg',
    'https://static.spacecrafted.com/db8f1d219b0c4bd19dd7652d86e61542/i/de44c8cc216d405e9827ba8085306fd1/1/4SoifmQp45JMgBnHp7ed2/Birthday%20Event%20-%20Brian.jpg',
    'https://a2zeventssolutions.com/wp-content/uploads/2021/06/qawali-setup.jpg',
    'https://itmenaan.pk/backend/public/admin/images/service-images/0_qawali-night-musical-night-live-concert-dj-night_1712481966.jpg',
    'https://idealeventsmanagement.com/wp-content/uploads/elementor/thumbs/New-Project-72-q6csc6lf0xsl1s5kfns03gm6zuuq8xeqa2wiheqxvk.jpg',
    'https://www.eventsindustryforum.co.uk/images/articles/about_the_eif.jpg',
    'https://cdn.earlytorise.com/wp-content/uploads/2008/02/event-promotion.jpg',
    'https://static.spacecrafted.com/db8f1d219b0c4bd19dd7652d86e61542/i/de44c8cc216d405e9827ba8085306fd1/1/4SoifmQp45JMgBnHp7ed2/Birthday%20Event%20-%20Brian.jpg',
    'https://a2zeventssolutions.com/wp-content/uploads/2021/06/qawali-setup.jpg',
    'https://itmenaan.pk/backend/public/admin/images/service-images/0_qawali-night-musical-night-live-concert-dj-night_1712481966.jpg',
    'https://idealeventsmanagement.com/wp-content/uploads/elementor/thumbs/New-Project-72-q6csc6lf0xsl1s5kfns03gm6zuuq8xeqa2wiheqxvk.jpg',
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