import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'box.dart';
import 'input_page.dart';
import 'bmi_math.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String result;
  final String interpretation;

  ResultPage(this.bmi, this.result, this.interpretation);

  //BmiMath result = BmiMath(height, weight, gender)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI PAGE"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                "Your Result:",
                style: bigBoxTextStyle.copyWith(fontSize: 50),
              ),
            ),
          ),
          Expanded(
            flex: 24,
            child: Box(
              boxChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        result,
                        style: resultTextStyle.copyWith(
                          color: result == 'Underweight'
                              ? Colors.cyanAccent
                              : result == 'Normal'
                                  ? Color(0xFF24D876)
                                  : result == 'Overweight'
                                      ? Colors.yellow
                                      : result == 'Obese'
                                          ? Colors.red
                                          : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                          child: Text(bmi.toString(), style: bmiTextStyle))),
                  Expanded(
                    child: Center(
                      child: Text(interpretation,
                          style: interpretationTextStyle,
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: secondaryColor,
                child: Center(
                    child: Text("RE-CALCULATE", style: bottomButtonTextStyle)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
