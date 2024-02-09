
import 'package:baharacake/resorce/color_manager.dart';
import 'package:baharacake/resorce/font_style_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data_res/data.dart';


class SlideArea extends StatefulWidget {
  final Color middleColor;
  const SlideArea({super.key, required this.middleColor});

  @override
  State<SlideArea> createState() => _SlideAreaState();
}

class _SlideAreaState extends State<SlideArea> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FontStyleManager fontManager = FontStyleManager();
    return Container(
        width: size.width,
        height: size.height * 0.4,
        color: ColorManager.primaryColorGold,
        child: Stack(
          children: [
            //bottom background color
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.12,
                color: widget.middleColor,
              ),
            ),
            //Slider area
            CarouselSlider(
                items: cakes.map((e) {
                  return Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: Image.asset(e["image"]).image,
                            fit: BoxFit.cover)),
                    child: Container(
                      margin: EdgeInsets.only(top: size.width * 0.55),
                      padding: EdgeInsets.symmetric(
                          vertical: size.width * 0.02,
                          horizontal: size.width * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.6),
                      ),
                      child: RichText(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "${e["name"]}\n",
                                style: fontManager.getHeadingStyle(
                                    fontSize: size.width * 0.035,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: e["description"],
                                style: fontManager.getHeadingStyle(
                                    fontSize: size.width * 0.035,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.normal))
                          ])),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                    height: size.height * 0.45, enlargeCenterPage: true)),
          ],
        ));
  }
}

