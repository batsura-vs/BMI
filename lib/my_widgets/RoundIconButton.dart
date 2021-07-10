import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  var child, onPress;
  RoundIconButton({this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      child: child,
      fillColor: Color(0xff293776),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
    );
  }
}
