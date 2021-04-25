import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain({this.height, this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Pretežak';
    } else if (_bmi > 18.5) {
      return 'Normalan';
    } else {
      return 'Premršav';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Trebao/la bi manje jesti';
    } else if (_bmi > 18.5) {
      return 'Normalna ti je težina';
    } else {
      return 'Trebao/la bi više jesti';
    }
  }
}
