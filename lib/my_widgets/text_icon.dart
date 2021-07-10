import 'package:flutter/material.dart';
import 'package:mbi/styles/styles.dart';

class TextIcon extends StatelessWidget {
  var text, icon;

  TextIcon(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 90.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
