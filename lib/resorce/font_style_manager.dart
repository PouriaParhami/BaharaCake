import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FontStyleManager {


  FontStyleManager();

  // double calculateFontSize(double referenceFontSize) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   // You can adjust this factor based on your design requirements
  //   double scaleFactor = screenWidth / 375.0;
  //   return referenceFontSize * scaleFactor;
  // }

  TextStyle getHeadingStyle({
    double fontSize = 16.05,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return GoogleFonts.workSans(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,

    );
  }
  TextStyle getCardStyle({
    double fontSize = 16.05,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double lineSpacing = 0.5,
  }) {
    return GoogleFonts.workSans(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: lineSpacing,
    );
  }


}

