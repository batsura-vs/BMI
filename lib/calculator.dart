import 'dart:math';

class CalculateBMI {
  var height, weight, _bmi;

  CalculateBMI({this.height, this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Лишний вес';
    } else if (_bmi > 18.5) {
      return 'Всё в норме';
    } else {
      return 'Недоедаете';
    }
  }

  String getComment() {
    if (_bmi >= 25) {
      return 'Надо по меньше есть и заниматься спортом.'
          ' Кушайте больше фруктов или овощей!';
    } else if (_bmi > 18.5) {
      return 'Всё в норме у вас оптимальный для вас вес! Поздравляем!';
    } else {
      return 'Вы весите меньше чем люди с таким же ростом! Кушайте больше!';
    }
  }
}
