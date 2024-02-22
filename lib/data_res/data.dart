
import 'package:BaharaConfectionary/screens/brith_day_screen.dart';
import 'package:BaharaConfectionary/screens/coffee_shop_screen.dart';
import 'package:BaharaConfectionary/screens/home_screen.dart';
import 'package:BaharaConfectionary/screens/wedding_screen.dart';

List cakes = [
  {
    'name':"Unicorn",
    'description':"Unicorn Birthday cake, Best option for you lovely princes. Unicorns Make your dreams real.",
    'image':"assets/images/birthday.jpg"
  },
  {
    'name':"Cheesecake",
    'description':"Pistachio cherry cheesecake, a light and pleasant dessert with tea or coffee that will change your day.",
    'image':"assets/images/chesscake.jpg"
  },
  {
    'name':"Fire Flame",
    'description':"Unique elegant design and red color which is a symbol of fire and love of Soran. A perfect gift for your loved one.",
    'image':"assets/images/fireflame.jpg"
  },
  {
    'name':"Pink hill",
    'description':"Delicate and delicate pink flowers blooming on a snowy hillside are a symbol of your love.",
    'image':"assets/images/wedding.jpg"
  },
  {
    'name':"Pure Love",
    'description':"White is a symbol of the purity of your love and the flowers that have blossomed from the warmth of your love. A simple and suitable cake to start your life together.",
    'image':"assets/images/birthdaytwo.jpg"
  },

];
Map<String, List<String>>? imageUrlMap;

List screens = [
   HomeScreen(homePictures: imageUrlMap?["home"],),
   BirthdayScreen(birthdayPictures: imageUrlMap?["birthday"],),
   CoffeeShopScreen(coffeeShopPictures: imageUrlMap?["coffeeShop"],),
   WeddingScreen(weddingPictures: imageUrlMap?["wedding"],),
];