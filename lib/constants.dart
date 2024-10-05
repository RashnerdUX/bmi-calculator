import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveContainer = Color(0xFF1E1D33);
const kInactiveContainer = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);

const kLabelTextStyle = TextStyle(
  color: Color(0xFF8D8E98),
  fontSize: 18.0,
);

const kLabelTextStyle2 = TextStyle(
  fontSize: 56.0,
  fontWeight: FontWeight.w900,
);

const kLabelTextStyle3 = TextStyle(
  fontSize: 22.0,
);

const kLargeButtonText = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
);

const SliderThemeData kSliderTheme = SliderThemeData(
  activeTrackColor: Color(0xFFEB1555),
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
  overlayColor: Color(0x29EB1555),
  inactiveTrackColor: Color(0xFF8D8E98),
);
