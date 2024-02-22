import 'package:BaharaConfectionary/resorce/color_manager.dart';
import 'package:BaharaConfectionary/resorce/font_style_manager.dart';
import 'package:BaharaConfectionary/resorce/text_manager.dart';
import 'package:BaharaConfectionary/widgets/card_information.dart';
import 'package:BaharaConfectionary/widgets/slide_area.dart';
import 'package:BaharaConfectionary/widgets/top_icon_area.dart';
import 'package:flutter/material.dart';

class BirthdayScreen extends StatefulWidget {
  final birthdayPictures;

  const BirthdayScreen({super.key, this.birthdayPictures});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    FontStyleManager googleFontStyle = FontStyleManager();

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primaryColorGreen,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            physics:  BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.6,
                  child:  Stack(
                    children: [
                      TopIconAre(
                        titleText: TextManager.birthdayTitle,
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SlideArea(
                            middleColor: ColorManager.primaryColorGold,
                            urlImages: widget.birthdayPictures,
                          )),
                    ],
                  ),
                ),
                CardInformation(
                  cardTextContent: TextSpan(children: [
                    TextSpan(
                        text: TextManager.birthdayDescription,
                        style: googleFontStyle.getCardStyle(
                            fontSize: size.width * 0.04,
                            lineSpacing: size.width * 0.003))
                  ]),
                  showMap: false,
                  contactStyle: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
