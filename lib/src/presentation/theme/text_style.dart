import 'package:flutter/material.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';

TextStyle customNormalText({double fontSize = 14}) => TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      color: textColor,
    );
TextStyle customBoldText({double fontSize = 16}) => TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: textColor,
    );
TextStyle normalText({double fontSize = 14, Color textColor = Colors.grey}) =>
    TextStyle(
        fontStyle: FontStyle.normal, fontSize: fontSize, color: textColor);
TextStyle boldText({double fontSize = 16}) => TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
