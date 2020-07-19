import 'package:flutter/material.dart';
import '../constants.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  RoundButton({this.icon, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPress();
      },
      shape: CircleBorder(),
      child: Icon(icon),
      fillColor: kRoundButtonColor,
      constraints: BoxConstraints.tightFor(
        width: kRoundButtonSize.toDouble(),
        height: kRoundButtonSize.toDouble(),
      ),
    );
  }
}
