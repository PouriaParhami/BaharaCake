import 'package:baharacake/resorce/color_manager.dart';
import 'package:baharacake/resorce/font_style_manager.dart';
import 'package:baharacake/resorce/text_manager.dart';
import 'package:baharacake/widgets/card_information.dart';
import 'package:baharacake/widgets/slide_area.dart';
import 'package:baharacake/widgets/top_icon_area.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.6,
                  child: const Stack(
                    children: [
                      TopIconAre(titleText: TextManager.welcomeTitle,),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SlideArea(middleColor: ColorManager.primaryColorGreen,)),
                    ],
                  ),
                ),
                CardInformation(cardTextContent: TextSpan(children: [
                  TextSpan(
                      text: TextManager.homePageShortAbout,
                      style: googleFontStyle.getCardStyle(
                          fontSize: size.width * 0.04, lineSpacing: size.width * 0.003))
                ]),
                  showMap: false,
                  contactStyle: false,),
                CardInformation(cardTextContent: TextSpan(children: [
                  TextSpan(
                      text: TextManager.location,
                      style: googleFontStyle.getCardStyle(
                          fontSize: size.width * 0.04, lineSpacing: size.width * 0.003))
                ]), showMap: true,
                  contactStyle: false,),
                CardInformation(cardTextContent: TextSpan(children: [
                  TextSpan(
                      text: "${TextManager.contact}\n",
                      style: googleFontStyle.getCardStyle(
                          fontSize: size.width * 0.04, lineSpacing: size.width * 0.003)),
                  WidgetSpan(
                      child: SizedBox(height: size.width * 0.09,)),
                  const TextSpan(
                    text: "Phone: ${TextManager.phoneNUmber}\n",
                  ),
                  const TextSpan(
                    text: "Email: ${TextManager.email}",
                  )
                ]),
                  showMap: false,
                  contactStyle: true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

