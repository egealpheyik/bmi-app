import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: firstColorDark,
        appBarTheme: AppBarTheme(
          color: secondaryColor,
        ),
      ),
      home: InputPage(),
    );
  }
}
