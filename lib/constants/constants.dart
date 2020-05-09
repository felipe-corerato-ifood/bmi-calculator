import 'package:flutter/material.dart';

enum Gender {
  MALE,
  FEMALE
}

const Map<String, Color> kAppColors = {
  'primaryColor': Color(0xFF0A0E21),
  'scaffoldBackgroundColor': Color(0xFF0A0E21),
};

const Map<String, Color> kCardStyles = {
  'activeColor': Color(0xFF1D1E33),
  'inactiveColor': Color(0xFF111328),
};

const kLabelTextStyle = TextStyle(
  color: Color(0xFF8D8E98),
  fontSize: 18, 
);

const kNumberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const Map<String, Color> kSliderStyle = {
  'activeColor': Color(0xFFFFFFFF),
  'inactiveColor': Color(0xFF8D8E98),
  'thumbColor': Color(0xFFEB1555),
  'overlayColor': Color(0x29EB1555),
};

const kLargeButtonStyle = {
  'color': Color(0xFFEB1555),
  'text': TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold
  ),
};

const kTitleTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold
);

const kResultCardStyles = {
  'resultText': TextStyle(
    color: Color(0xFF24D876),
    fontSize: 22,
    fontWeight: FontWeight.bold
  ),
  'bmiText': TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.bold
  ),
  'bodyText': TextStyle(
    fontSize: 22
  )
};
