import 'package:flutter/material.dart';
import 'constants.dart';

class Box extends StatelessWidget {
  Box({this.boxColor = firstColorLight, this.boxChild, this.onTapFunc});

  Color boxColor;
  Widget? boxChild;
  VoidCallback? pressHandler;
  final GestureTapCallback? onTapFunc;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        child: boxChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: boxColor,
        ),
      ),
    );
  }
}
