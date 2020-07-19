import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  final Color colour;
  final Widget newChild;
  final Function onPress;

  NewCard({@required this.colour, this.newChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: newChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
