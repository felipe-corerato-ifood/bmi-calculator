import 'package:flutter/material.dart';

import 'pages/input_page.dart';
import 'constants/constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kAppColors['primaryColor'],
        scaffoldBackgroundColor: kAppColors['scaffoldBackgroundColor'],
      ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}