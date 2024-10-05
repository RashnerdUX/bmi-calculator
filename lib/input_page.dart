import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablecard.dart';
import 'genderinfo.dart';
import 'constants.dart';
import 'results_overview.dart';
import 'rounded_button.dart';
import 'bottom_button.dart';

enum Gender { male, female }

enum Arithmetric { add, subtract }

double userHeight = 100.0;
double userWeight = 56;
double valueIconSize = 48;
int userAge = 16;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  userGender(Gender selectGender) {
    setState(() {
      selectedGender = selectGender;
    });
  }

  Arithmetric? chosenAction;

  chosenArithmetric(Arithmetric chooseAction) {
    setState(() {
      chosenAction = chooseAction;
    });

    if (chosenAction == Arithmetric.add) {
      userWeight++;
    } else if (chosenAction == Arithmetric.subtract) {
      userWeight--;
    }
  }

  defaultFunction() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? kActiveContainer
                          : kInactiveContainer,
                      cardChild: genderContent(FontAwesomeIcons.mars, 'MALE'),
                      getUserInteraction: () {
                        userGender(Gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? kActiveContainer
                          : kInactiveContainer,
                      cardChild:
                          genderContent(FontAwesomeIcons.venus, 'FEMALE'),
                      getUserInteraction: () {
                        userGender(Gender.female);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveContainer,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$userHeight',
                                style: kLabelTextStyle2,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle3,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xFFFFFFFF),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 16.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 24.0),
                              overlayColor: Color(0x29EB1555),
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                            ),
                            child: Slider(
                              value: userHeight,
                              min: 100.0,
                              max: 300.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  userHeight = newValue.roundToDouble();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveContainer,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            '$userWeight',
                            style: kLabelTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                buttonInteraction: () {
                                  chosenArithmetric(Arithmetric.subtract);
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                buttonInteraction: () {
                                  chosenArithmetric(Arithmetric.add);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveContainer,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$userAge',
                          style: kLabelTextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              icon: FontAwesomeIcons.minus,
                              buttonInteraction: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedButton(
                              icon: FontAwesomeIcons.plus,
                              buttonInteraction: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottomActionButton(
              buttonText: 'CALCULATE',
              buttonFunction: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: userHeight, weight: userWeight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsOverview(
                        bmiValue: calc.bmiResults(),
                        bmiRange: calc.bmiInterpretation(),
                        bmiFeedback: calc.bmiFeedback(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
