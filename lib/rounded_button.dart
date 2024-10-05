import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  late final IconData? icon;
  late final Function()? buttonInteraction;

  RoundedButton({this.icon, this.buttonInteraction});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: buttonInteraction,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 4.0,
    );
  }
}
