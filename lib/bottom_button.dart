import 'package:flutter/material.dart';
import 'constants.dart';

class BottomActionButton extends StatelessWidget {
  BottomActionButton({this.buttonText, this.buttonFunction});

  String? buttonText;
  late final Function()? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        child: Center(
          child: Text(
            '$buttonText',
            style: kLargeButtonText,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
