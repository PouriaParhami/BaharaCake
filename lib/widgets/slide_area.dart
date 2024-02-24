import 'dart:async';

import 'package:BaharaConfectionary/resorce/color_manager.dart';
import 'package:BaharaConfectionary/resorce/font_style_manager.dart';
import 'package:BaharaConfectionary/resorce/text_manager.dart';
import 'package:BaharaConfectionary/widgets/full_screen_image_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideArea extends StatefulWidget {
  final Color middleColor;
  final List<String> urlImages;

  const SlideArea(
      {super.key, required this.middleColor, required this.urlImages});

  @override
  State<SlideArea> createState() => _SlideAreaState();
}

class _SlideAreaState extends State<SlideArea> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
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
          // Slider area
          CarouselSlider(
            items: widget.urlImages.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      _showImageFullScreen(context, e);
                      // FullScreenPreview(imageUrl: e,);
                    },
                    child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: e,
                              placeholder: (context, url) =>
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                              width: size.width,
                              height: size.height,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: size.width * 0.24,
                              // margin: EdgeInsets.only(top: size.width * 0.55),
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
                                        text: "Bahara: \n",
                                        style: fontManager.getHeadingStyle(
                                            fontSize: size.width * 0.035,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: TextManager.birthdayDescription,
                                        style: fontManager.getHeadingStyle(
                                            fontSize: size.width * 0.035,
                                            color: Colors.white60,
                                            fontWeight: FontWeight.normal))
                                  ])),
                            ),
                          )
                        ])),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
                height: size.height * 0.45,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }
            ),
          ),
        ],
      ),
    );
  }

  void _showImageFullScreen(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FullScreenImageDialog(imageUrl: imageUrl);
      },
    );
  }
}

// Navigator.of(context).push(
//   MaterialPageRoute(
//     builder: (BuildContext context) {
//       return FullScreenPreview(imageUrl: imageUrl);
//     },
//   ),
// );