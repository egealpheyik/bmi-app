import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'constants.dart';

class BmiMath {
  final int height;
  final int weight;
  final Gender gender;

  BmiMath(this.height, this.weight, this.gender);

  double calculateBmi(int height, int weight) {
    double bmi = weight * 10000 / (height * height);
    return double.parse(bmi.toStringAsFixed(1));
  }

  String getResult(double bmi) {
    return bmi < 18.5
        ? 'Underweight'
        : bmi < 25
            ? 'Normal'
            : bmi < 30
                ? 'Overweight'
                : 'Obese';
  }

  String getInterpretation(double bmi) {
    return bmi < 18.5
        ? 'You have a lower than normal body weight. You can eat a bit more.'
        : bmi < 25
            ? 'You have a normal body weight. Good job!'
            : bmi < 30
                ? 'You have a higher than normal body weight. Try to exercise more.'
                : 'Your health is in danger. You need to go to a doctor immediately.';
  }
}
