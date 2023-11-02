import 'package:flutter/material.dart';

Widget customTextRegular(
    {required String title,
    double height = 1,
    double latterSpacing = 0.7,
    TextOverflow? overflow,
    bool isunderline = false,
    int maxlines = 6,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.start,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign align = TextAlign.start}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fontSize,
      fontFamily: 'Poppins',
      // fontFamily: 'Montserrat-VariableFont_wght',
      fontWeight: fontWeight,
      decoration: isunderline ? TextDecoration.underline : TextDecoration.none,
      color: color,
      height: height,
      overflow: overflow,
      letterSpacing: latterSpacing,
    ),
    maxLines: maxlines,
    overflow: overflow,
    textAlign: align,
  );
}
