import 'package:BaharaConfectionary/resorce/color_manager.dart';
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.homePageDescriptionCardColor),
      child: Column(
        children: [
          RichText(
              textAlign:
                  widget.contactStyle ? TextAlign.center : TextAlign.left,
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
              text: widget.cardTextContent),
          widget.showMap
              ? GestureDetector(
                  onTap: () {
                    lunchMap();
                  },
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.23,
                    margin: EdgeInsets.only(top: size.width * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image:
                                Image.asset("assets/images/baharacakemap.png")
                                    .image,
                            fit: BoxFit.cover),
                        color: Colors.black),
                  ),
                )
              : const SizedBox.shrink(),
          widget.contactStyle
              ? Container(
            margin: EdgeInsets.only(top: size.width * 0.04),
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          lunchEmail();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          lunchInstagram();
                        },
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
                        ),
                        onPressed: () {
                          lunchWebSite();
                        },
                      ),
                    ],
                  ),
                )
              : widget.showMap
                  ? Container(
                      width: size.width * 0.9,
                      margin: EdgeInsets.only(top: size.width * 0.01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: Image.asset("assets/images/map.png").image,
                              fit: BoxFit.cover),
                          color: Colors.black),
                    )
                  : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Future lunchEmail() async {
    await launchUrl(Uri.parse(
        "mailto:baharacake@gmail.com?subject=Order&body=Hello Dear bahara Cake"));
  }

  Future lunchInstagram() async {
    await launchUrl(Uri.parse(
        "https://www.instagram.com/bahara.cake?igsh=cW9wM3h3bWsybHlo"));
  }

  Future lunchLinkedin() async {
    await launchUrl(
        Uri.parse("https://www.linkedin.com/in/bahar-sadeghi-183b60194/"));
  }

  Future lunchWebSite() async {
    await launchUrl(Uri.parse("https://baharacake.com/"));
  }

  Future lunchMap() async {
    await launchUrl(Uri.parse(
        "https://www.google.com/maps/place/Baharacake/@36.3148779,59.4847056,17z/data=!3m1!4b1!4m6!3m5!1s0x3f6c9358111d47f9:0x1f9c83c35443dfd!8m2!3d36.3148736!4d59.4872805!16s%2Fg%2F11r1fx4kkm?entry=ttu"));
  }
}
