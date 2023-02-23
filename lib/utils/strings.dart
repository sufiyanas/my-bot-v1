import 'package:flutter/material.dart';

body1(Color color) {
  return TextStyle(
      color: color,
      fontFamily: "inter",
      fontSize: 13,
      textBaseline: TextBaseline.values[1],
      //   height: 20,

      letterSpacing: -0.2,
      wordSpacing: 1,
      fontWeight: FontWeight.w400);
}

body2(Color color) {
  return TextStyle(
      fontFamily: "inter",
      color: color,
      fontSize: 15,
      // height: 20,
      letterSpacing: -0.2,
      fontWeight: FontWeight.w400);
}

button(Color color) {
  return TextStyle(
      fontFamily: "inter",
      fontSize: 13,
      color: color,
      // height: 20,
      letterSpacing: -0.2,
      fontWeight: FontWeight.w600);
}

heading(Color color) {
  return TextStyle(
      fontFamily: "inter",
      fontSize: 22,
      color: color,
      //height: 20,
      letterSpacing: -0.2,
      fontWeight: FontWeight.w700);
}

// TextStyle buttonStyle = GoogleFonts.inter(
//   fontSize: 16,
//   fontWeight: FontWeight.w500,
//   color: Colors.white,
// );