import 'package:baharacake/screens/nav_screen.dart';
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
                    duration: const Duration(milliseconds: 1600),
                    top: showAnimate ? size.height * 0.15 : size.height * 0.35,
                    left: size.width * 0.001,
                    child: Container(
                      width: size.width * 0.99,
                      height: size.width * 0.99,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: Image.asset("assets/images/logo_en_gold_conf_v3_no_bg.png").image,
                              fit: BoxFit.cover)),
                    )),
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 1600),
                    bottom: showAnimate? size.width * 0.0001: -85,
                    left:  showAnimate? -250: -350,
                    child: AnimatedOpacity(
                      opacity: showAnimate? 1 : 0,
                      duration: const Duration(milliseconds: 1600),
                      child: Container(

                        width: size.width * 2,
                        height: size.width ,
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
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      showAnimate = true;
    });
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const NavScreen()));
  }
}
