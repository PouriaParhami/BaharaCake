import 'package:baharacake/resorce/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



class CardInformation extends StatefulWidget {
  final TextSpan cardTextContent;
  final bool showMap;
  final bool contactStyle;

  const CardInformation(
      {super.key,
        required this.cardTextContent,
        required this.showMap,
        required this.contactStyle});

  @override
  State<CardInformation> createState() => _CardInformationState();
}

class _CardInformationState extends State<CardInformation> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02, horizontal: size.width * 0.04),
      margin: EdgeInsets.only(top: size.width * 0.04),
      width: size.width * 0.9,
      height: size.height * 0.30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.homePageDescriptionCardColor),
      child: Column(
        children: [
          RichText(
              textAlign:
              widget.contactStyle ? TextAlign.center : TextAlign.left,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              text: widget.cardTextContent),
          widget.showMap
              ? Container(
            width: size.width * 0.9,
            height: size.height * 0.23,
            margin: EdgeInsets.only(top: size.width * 0.01),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image:
                    Image.asset("assets/images/map.png").image,
                    fit: BoxFit.cover),
                color: Colors.black),
          )
              : const SizedBox.shrink(),
          widget.contactStyle
              ? Container(
            margin: EdgeInsets.only(top: size.height * 0.03),
            width: size.width * 0.5,
            height: size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ), onPressed: () { lunchEmail(); },
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                  ), onPressed: () { lunchInstagram(); },
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    lunchLinkedin();
                  },
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.white,
                  ), onPressed: () { lunchWebSite(); },
                ),
              ],
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Future lunchEmail() async{
    await launchUrl(Uri.parse("mailto:baharacake@gmail.com?subject=Order&body=Hello Dear bahara Cake"));
  }

  Future lunchInstagram() async{
    await launchUrl(Uri.parse("https://www.instagram.com/bahara.cake?igsh=cW9wM3h3bWsybHlo"));
  }

  Future lunchLinkedin() async {

    await launchUrl(Uri.parse("https://www.linkedin.com/in/bahar-sadeghi-183b60194/"));
  }

  Future lunchWebSite() async {

    await launchUrl(Uri.parse("https://baharacake.com/"));
  }
}
