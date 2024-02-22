import 'package:BaharaConfectionary/screens/brith_day_screen.dart';
import 'package:BaharaConfectionary/screens/coffee_shop_screen.dart';
import 'package:BaharaConfectionary/screens/home_screen.dart';
import 'package:BaharaConfectionary/screens/wedding_screen.dart';

List<String> cakes = [
  "assets/images/birthday.jpg",
  "assets/images/chesscake.jpg",
  "assets/images/fireflame.jpg",
  "assets/images/wedding.jpg",
  "assets/images/birthdaytwo.jpg",
];
Map<String, List<String>>? imageUrlMap;

List screens = [
  HomeScreen(
    homePictures: imageUrlMap?["home"],
  ),
  BirthdayScreen(
    birthdayPictures: imageUrlMap?["birthday"],
  ),
  CoffeeShopScreen(
    coffeeShopPictures: imageUrlMap?["coffeeShop"],
  ),
  WeddingScreen(
    weddingPictures: imageUrlMap?["wedding"],
  ),
];
