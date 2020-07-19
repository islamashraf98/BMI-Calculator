import 'dart:math';
import 'file:///E:/Mobile%20development/Projects/bmi-calculator-flutter/lib/components/bottom_button.dart';
import 'package:bmi_calculator/calculate-bmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///E:/Mobile%20development/Projects/bmi-calculator-flutter/lib/components/IconContent.dart';
import 'file:///E:/Mobile%20development/Projects/bmi-calculator-flutter/lib/components/NewCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'file:///E:/Mobile%20development/Projects/bmi-calculator-flutter/lib/components/round_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }
enum Number { increase, decrease }

class _InputPageState extends State<InputPage> {
  Color maleColor = kNewCardColor, femaleColor = kNewCardColor;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: NewCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kNewCardColor,
                    newChild: IconContent(
                        gender: 'MALE', icon: FontAwesomeIcons.mars),
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: NewCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kNewCardColor,
                    newChild: IconContent(
                        gender: 'FEMALE', icon: FontAwesomeIcons.venus),
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.female;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: NewCard(
                    colour: kNewCardColor,
                    newChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Height', style: kTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(kHeight.toString(), style: kNumberStyle),
                            Text(
                              'cm',
                              style: kTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: kLeftSliderColor,
                            inactiveTrackColor: kRightSliderColor,
                            thumbColor: kThumbColor,
                            overlayColor: kOverlayColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                              value: kHeight.toDouble(),
                              min: kMin,
                              max: kMax,
                              onChanged: (double value) {
                                setState(() {
                                  kHeight = value.round();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: NewCard(
                    colour: kNewCardColor,
                    newChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kTextStyle,
                        ),
                        Text(
                          kWeight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    kWeight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    kWeight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: NewCard(
                    colour: kNewCardColor,
                    newChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kTextStyle,
                        ),
                        Text(kAge.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  kAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  kAge++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              text: 'Calculate my BMI',
              onPress: () {
                Calculator calc = Calculator(weight: kWeight, height: kHeight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                      bmi: calc.getBMI(),
                      result: calc.getResult(),
                      advice: calc.getAdvice(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
