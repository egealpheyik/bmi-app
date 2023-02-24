import 'package:flutter/material.dart';
import 'constants.dart';

class GenderBox extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;

  GenderBox({
    required this.genderIcon,
    required this.genderText,
  });

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          color: thirdColor,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genderText,
          style: boxTextStyle,
        ),
      ],
    );
  }
}
