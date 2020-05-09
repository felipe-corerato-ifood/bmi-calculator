import 'package:flutter/material.dart';

import '../constants/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({Key key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          label, 
          style: kLabelTextStyle, 
        ),
      ],
    );
  }
}