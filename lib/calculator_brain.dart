import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  double height;
  double weight;
  double _bmi = 0;

  void calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
  }

  String bmiResults() {
    if (_bmi == 0) {
      calculateBMI();
    }
    return _bmi.toStringAsFixed(1);
  }

  String bmiInterpretation() {
    if (_bmi == 0) {
      calculateBMI();
    }

    if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String bmiFeedback() {
    if (_bmi == 0) {
      calculateBMI();
    }

    if (_bmi >= 30) {
      return 'You need to hit the Gym ASAP. You are at risk of various diseases';
    } else if (_bmi >= 25) {
      return 'You need to make some lifestyle choices to avoid the red zone';
    } else if (_bmi >= 18.5) {
      return 'Your BMI is very good. Keep it up';
    } else {
      return 'You are not doing too badly but you are not doing well either';
    }
  }
}
