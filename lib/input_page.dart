import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'box.dart';
import 'gender_box.dart';
import 'result_page.dart';
import 'bmi_math.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = firstColorLight;
  Color femaleColor = firstColorLight;
  int height = 170;
  int weight = 60;
  int age = 20;
  Gender gender = Gender.male;

  void changeColorGender(Gender gender) {
    maleColor = gender == Gender.male ? secondaryColor : firstColorLight;
    femaleColor = gender == Gender.male ? firstColorLight : secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Box(
                            onTapFunc: () {
                              setState(
                                () {
                                  changeColorGender(Gender.male);
                                  gender = Gender.male;
                                },
                              );
                            },
                            boxColor: maleColor,
                            boxChild: GenderBox(
                                genderIcon: FontAwesomeIcons.mars,
                                genderText: "MALE"),
                          ),
                        ),
                        Expanded(
                          child: Box(
                            onTapFunc: () {
                              setState(() {
                                changeColorGender(Gender.female);
                                gender = Gender.female;
                              });
                            },
                            boxColor: femaleColor,
                            boxChild: GenderBox(
                              genderText: "FEMALE",
                              genderIcon: FontAwesomeIcons.venus,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Box(
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text("YOUR HEIGHT:", style: boxTextStyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(), style: bigBoxTextStyle),
                            Text("cm", style: boxTextStyle),
                          ],
                        ),
                        Slider(
                            thumbColor: secondaryColorDark,
                            activeColor: secondaryColor,
                            inactiveColor: firstColorDark,
                            value: height.toDouble(),
                            min: 135,
                            max: 220,
                            onChanged: (double finalHeight) {
                              setState(() {
                                height = finalHeight.toInt();
                              });
                            }),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: Box(
                          boxChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("YOUR WEIGHT:", style: boxTextStyle),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    weight.toString(),
                                    style: bigBoxTextStyle,
                                  ),
                                  Text(
                                    "kg",
                                    style: boxTextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    onTapFunction: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon: FontAwesomeIcons.minus,
                                  ),
                                  SizedBox(width: 10),
                                  RoundIconButton(
                                    onTapFunction: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                        Expanded(
                            child: Box(
                          boxChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "YOUR AGE:",
                                style: boxTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: bigBoxTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onTapFunction: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onTapFunction: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      BmiMath bmiObject = BmiMath(height, weight, gender);
                      double bmi = bmiObject.calculateBmi(height, weight);
                      String result = bmiObject.getResult(bmi);
                      String interpretation = bmiObject.getInterpretation(bmi);
                      return ResultPage(bmi, result, interpretation);
                    }),
                  );
                },
                child: Container(
                  width: double.infinity,
                  color: secondaryColor,
                  margin: EdgeInsets.only(top: 10),
                  child: const Center(
                    child: Text("CALCULATE", style: bottomButtonTextStyle),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onTapFunction});
  final IconData? icon;
  final Function? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      child: Icon(icon, color: Colors.white),
      onPressed: () {
        onTapFunction!();
      },
      shape: CircleBorder(),
      fillColor: secondaryColor,
    );
  }
}
