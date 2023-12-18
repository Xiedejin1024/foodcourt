import 'package:flutter/material.dart';

class DJFilterViewModel extends ChangeNotifier {
  bool _isGlutenFree = false; //蛋白
  bool _isVegan = false; //严格素食
  bool _isVegetarian = false; //素食
  bool _isLactoseFree = false;//乳糖

  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }

  bool get isVegetarian => _isVegetarian;

  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  } //乳糖
}
