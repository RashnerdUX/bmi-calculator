import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/bottom_button.dart';

class ResultsOverview extends StatelessWidget {
  final String? bmiValue;
  final String? bmiRange;
  final String? bmiFeedback;

  ResultsOverview({this.bmiValue, this.bmiFeedback, this.bmiRange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12.0),
                  color: kActiveContainer,
                ),
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$bmiRange',
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$bmiValue',
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$bmiFeedback',
                      style: kLabelTextStyle3,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomActionButton(
              buttonText: 'RE-CALCULATE',
              buttonFunction: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
