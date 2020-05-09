import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final Color color;
  final Widget child;

  const BottomButton({
    Key key, this.onPress, this.color, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: color,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 80,
        child: Center(
          child: child
        ),
      ),
    );
  }
}