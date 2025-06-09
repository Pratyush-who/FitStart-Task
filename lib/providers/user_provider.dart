import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _name;
  int? _age;
  double? _height;
  double? _weight;
  double? _bmi;
  String? _fitnessGoal;

  String? get name => _name;
  int? get age => _age;
  double? get height => _height;
  double? get weight => _weight;
  double? get bmi => _bmi;
  String? get fitnessGoal => _fitnessGoal;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }

  void setHeight(double height) {
    _height = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void calculateBMI() {
    if (_height != null && _weight != null) {
      _bmi = _weight! / ((_height! / 100) * (_height! / 100));
      notifyListeners();
    }
  }

  void setFitnessGoal(String goal) {
    _fitnessGoal = goal;
    notifyListeners();
  }

  void reset() {
    _name = null;
    _age = null;
    _height = null;
    _weight = null;
    _bmi = null;
    _fitnessGoal = null;
    notifyListeners();
  }
}
