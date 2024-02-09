import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resorce/color_manager.dart';

class TopIconAre extends StatefulWidget {
  final String titleText;

  const TopIconAre({super.key, required this.titleText});

  @override
  State<TopIconAre> createState() => _TopIconAreState();
}

class _TopIconAreState extends State<TopIconAre> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.25,
      color: ColorManager.primaryColorGold,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: size.height,
            width: size.width * 0.4,
            padding: EdgeInsets.only(top: size.height * 0.15),
            child: Text(widget.titleText,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.normal)),
          ),
          // Icon area.
          SizedBox(
              width: size.width * 0.24,
              height: size.width * 0.24,
              child: Image.asset("assets/icons/img.png"))
        ],
      ),
    );
  }
}
