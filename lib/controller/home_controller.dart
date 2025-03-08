import 'package:get/get.dart';
import 'package:pak_festive/screens/events/event_detail.dart';
import 'package:pak_festive/screens/restaurants/restaurant_detail.dart';
import '../screens/deals_offers/all_deals_offers.dart';
import '../screens/deals_offers/all_hi_tea_buffets.dart';
import '../screens/events/all_events.dart';
import '../screens/restaurants/all_restaurants.dart';

class HomeController extends GetxController{

  RxBool isFavourite = false.obs;
  List events=[
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

  List offers=[
    'https://hamariweb.com/directories/info/img/cheezious%20imge.jpg',
    'https://insidefaisalabad.com/wp-content/uploads/2023/10/Screenshot_20231006-010516.jpg',
    'https://i0.wp.com/thefreebieguy.com/wp-content/uploads/2023/10/Wednesday-Food-Deals.png?fit=1200%2C630&ssl=1',
    'https://savvyperks.com/wp-content/uploads/2018/05/2-for-1-Deals-Savvy-Perks-Restaurant-Deals.jpg',
    'https://rancherscafe.com/_next/image?url=https%3A%2F%2Franchers.s3.ap-southeast-1.amazonaws.com%2Fapp-banners%2F1739353338158%2Fwebsitebannerhappiness.jpg&w=3840&q=75',
    'https://foodsspot.com/wp-content/uploads/2024/09/Deal-1-600x600.jpeg',
  ];

  List buffet=[
    'https://findamenus.com/wp-content/uploads/2024/03/7-1.jpg',
    'https://static.tossdown.com/images/414e4d46-3924-4bde-a5db-c22d16b91454.webp',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDScYY-Yy8Zxav2qCuWEBnOS1WTM3uoljYdg&s',
    'https://findamenus.com/wp-content/uploads/2024/03/1-5.jpg',
    'https://mizaajrestaurant.com/wp-content/uploads/2025/03/iftar-buffet-menu.jpeg',
    'https://findamenus.com/wp-content/uploads/2024/03/2-5-768x768.jpg',
  ];

  List restaurants=[
    'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZXZlbnR8ZW58MHx8MHx8fDA%3D',
   'https://lesroches.edu/wp-content/uploads/2022/08/Restaurant_business_plan_main.jpg',
    'https://rezku.com/blog/assets/img/articles/2024-03-01-restaurant-interior-design/restaurant-interior-design-example.jpeg',
    'https://assets.architecturaldigest.in/photos/6385cf3311f0276636badfb6/16:9/w_2560%2Cc_limit/DSC_8367-Edit-W.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Restaurant_N%C3%A4sinneula.jpg/1200px-Restaurant_N%C3%A4sinneula.jpg',
    'https://teamnutrition.ca/sites/default/files/articles/Inte%CC%81rieur%20restaurant%20-%20Restaurant%20interior.jpeg',
    'https://www.petitfute.com/medias/listingpoi-image/cat-1165/image13.jpg',
  ];


  void toggleForFavorite() {
    isFavourite.value = !isFavourite.value;
  }

  viewEventDetail(String title){
    Get.to(()=> EventDetailScreen(title: 'Event Detail',));
  }

  viewAllDealsAndOffers(){
    Get.to(()=> AllDealsOffers());
  }

  viewAllBuffets(){
    Get.to(()=> AllHiTeaBuffets());
  }

  viewRestaurantDetail(String title){
    Get.to(()=> RestaurantDetailScreen(title: 'Restaurant',));
  }

  viewAllEvents(){
    Get.to(()=> AllEvents());
  }

  viewAllRestaurants(){
    Get.to(()=>AllRestaurants());
  }

}