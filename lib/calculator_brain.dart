import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.height, this.weight);

  final int height;
  final int weight;

  double _bmi = 0.0;

  String calculateBMI() {
    // Calculate BMI
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'you are high than normal body weight, try to exercise more.';
    } else if (_bmi > 18.5&& _bmi < 25) {
      return 'you are a normal body weight, good job!';
    } else {
      return 'you have a lower than normal body weight, you can eat a bit more.';
    }
  }
}
