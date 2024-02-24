import 'dart:math';

import 'package:BaharaConfectionary/data_res/data.dart';
import 'package:BaharaConfectionary/screens/nav_screen.dart';
import 'package:BaharaConfectionary/services/apiConst.dart';
import 'package:BaharaConfectionary/services/extract_images.dart';
import 'package:BaharaConfectionary/services/word_press_api.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showAnimate = false;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  // Function to get 2 random URLs from a given list
  List<String> getRandomURLs(List<String> list) {
    List<String> randomURLs = [];
    Random random = Random();
    while (randomURLs.length < 2) {
      int randomIndex = random.nextInt(list.length);
      if (!randomURLs.contains(list[randomIndex])) {
        randomURLs.add(list[randomIndex]);
      }
    }
    return randomURLs;
  }

  // Add 2 random URLs from each list to the new list


  Future<Map<String, List<String>>> getWpData() async {
    WordPressApi wpApi = WordPressApi(ApiConst.mainUrl);
    var wpApiImages = await wpApi.getData();
    Map<String, List<String>> pictureUrlMaps;

    if (wpApiImages == false){
      pictureUrlMaps = {
        "birthday": cakes,
        "coffeeShop": cakes,
        "wedding": cakes,
        "home": cakes

      };
    }else{
      // get wedding, coffee shop and birthday html images
      String birtDayUrls = wpApiImages[0]["content"]["rendered"];
      String coffeeShopUrls = wpApiImages[1]["content"]["rendered"];
      String weddingUrls = wpApiImages[2]["content"]["rendered"];

      // Extract just images urls
      List<String> birthDayImageUrls =
      ExtractImages.extractImageUrls(birtDayUrls);
      List<String> coffeeShopImageUrls =
      ExtractImages.extractImageUrls(coffeeShopUrls);
      List<String> weddingImageUrls =
      ExtractImages.extractImageUrls(weddingUrls);
      // get random images for home page
      List<String> randomImageHomePage = [];
      randomImageHomePage.addAll(getRandomURLs(birthDayImageUrls));
      randomImageHomePage.addAll(getRandomURLs(coffeeShopImageUrls));
      randomImageHomePage.addAll(getRandomURLs(weddingImageUrls));

      pictureUrlMaps = {
        "birthday": birthDayImageUrls,
        "coffeeShop": coffeeShopImageUrls,
        "wedding": weddingImageUrls,
        "home": randomImageHomePage
      };
    }

    return pictureUrlMaps;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
            child: Stack(
              children: [
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 2600),
                    top: showAnimate ? size.height * 0.15 : size.height * 0.35,
                    left: size.width * 0.001,
                    child: AnimatedOpacity(
                      opacity: showAnimate? 1 : 0,
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        width: size.width * 0.99,
                        height: size.width * 0.99,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: Image.asset("assets/images/logo_en_gold_conf_v3_no_bg.png").image,))),
                    )
                ),

                AnimatedPositioned(
                    duration: const Duration(milliseconds: 2600),
                    bottom: showAnimate? size.width * 0.0001: -85,
                    left:  showAnimate? -250: -350,
                    child: AnimatedOpacity(
                      opacity: showAnimate? 1 : 0,
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        width: size.width * 2,
                        height: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: Image.asset("assets/images/cakesplash.png").image,
                                fit: BoxFit.cover)),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      showAnimate = true;
    });
    // white for 1 second
    await Future.delayed(const Duration(seconds: 1));
    // get data from Wordpress API
    Map<String, List<String>> pictures = await getWpData();

    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
           return NavScreen(pictureUrls: pictures,);}
    ));
  }
}
