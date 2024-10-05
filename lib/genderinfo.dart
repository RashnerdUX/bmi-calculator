import 'package:flutter/material.dart';
import 'constants.dart';

class genderContent extends StatelessWidget {
  genderContent(this.genderIcon, this.genderName);

  final IconData genderIcon;
  final String genderName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(height: 12.0),
        Text(
          genderName,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
