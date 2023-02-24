import 'package:flutter/material.dart';

const Color firstColorLight = Color.fromRGBO(57, 62, 70, 1);
const Color firstColorDark = Color.fromRGBO(34, 40, 49, 1);
const Color secondaryColor = Color.fromRGBO(0, 173, 181, 1);
const Color secondaryColorDark = Color.fromRGBO(0, 100, 107, 1);
const Color thirdColor = Color.fromRGBO(238, 238, 238, 1);

const TextStyle boxTextStyle =
    TextStyle(color: thirdColor, fontSize: 20, fontWeight: FontWeight.bold);

const TextStyle bigBoxTextStyle =
    TextStyle(color: thirdColor, fontSize: 60, fontWeight: FontWeight.w900);

double kBaseValueHeight = 175;

const TextStyle bottomButtonTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 35,
);

enum Gender {
  male,
  female,
}

const TextStyle interpretationTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 24,
);
const TextStyle resultTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50,
);
const TextStyle bmiTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w900,
  fontSize: 90,
);
