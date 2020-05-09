import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function onPress;

  const ReusableCard({Key key, this.child, this.color, this.onPress}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)
          ),
          child: child,
        ),
    );
  }
}