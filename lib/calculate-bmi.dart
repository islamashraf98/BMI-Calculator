import 'dart:math';
import 'package:flutter/cupertino.dart';

class Calculator {
  final int weight;
  final int height;
  double _bmi;

  Calculator({@required this.weight, @required this.height});

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getAdvice() {
    if (_bmi > 25)
      return 'Try dieting and exercising';
    else if (_bmi > 18.5)
      return 'Ideal range, great';
    else
      return 'Try eating more';
  }
}
