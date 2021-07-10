import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  var child, color, tap;

  ContainerCard({this.child, this.color, this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
