import 'package:flutter/material.dart';

import '../model/meal_model.dart';
import 'filter_viewmodel.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<DJMealModel> _meals = [];

  DJFilterViewModel? _filterVM;

  void updateFilters(DJFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<DJMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM!.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM!.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM!.isVegan && !meal.isVegan) return false;
      if (_filterVM!.isVegetarian && !meal.isVegetarian) return false;
      return true;
    }).toList();
  }

  //获取原始的meal，才能进行增加，删除操作
  List<DJMealModel> get originalMeals {
    return _meals;
  }

  set meals(List<DJMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}
