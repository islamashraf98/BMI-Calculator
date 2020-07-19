import 'file:///E:/Mobile%20development/Projects/bmi-calculator-flutter/lib/components/bottom_button.dart';
import 'package:bmi_calculator/calculate-bmi.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'file:///E:/Mobile%20development/Projects/bmi-calculator-flutter/lib/components/NewCard.dart';

class Results extends StatelessWidget {
  final String bmi, result, advice;
  Results({@required this.bmi, @required this.result, @required this.advice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Your Result', style: kTitleStyle),
          Expanded(
            flex: 5,
            child: NewCard(
              colour: kNewCardColor,
              newChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result,
                    style: kResultStyle,
                  ),
                  Text(
                    bmi,
                    style: kBMIStyle,
                  ),
                  Text(
                    advice,
                    style: kAdviceStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              text: 'RE-Calculate',
              onPress: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
