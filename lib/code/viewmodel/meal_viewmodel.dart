import 'package:flutter/cupertino.dart';
import 'package:foodcourt/code/viewmodel/base_meal_viewmodel.dart';
import 'package:foodcourt/code/viewmodel/filter_viewmodel.dart';

import '../model/meal_model.dart';
import '../services/meal_request.dart';

/*
* 注意要去启动配置监听ChangeNotifierProvider，不然报错*/
class DJMealViewModel extends BaseMealViewModel {
  DJMealViewModel() {
    MealRequest.getMealData().then((value) {
      meals = value;
      notifyListeners();
    });
  }
}
