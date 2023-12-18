import 'package:foodcourt/code/viewmodel/base_meal_viewmodel.dart';

import '../model/meal_model.dart';

class DJCollectViewModel extends BaseMealViewModel {
  void addMeal(DJMealModel mealModel) {
    originalMeals.add(mealModel);
    notifyListeners();
  }

  void removeMeal(DJMealModel mealModel) {
    originalMeals.remove(mealModel);
    notifyListeners();
  }

  bool isCollect(DJMealModel meal) {
    return originalMeals.contains(meal);
  }

  void handleMeal(DJMealModel meal) {
    if (isCollect(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}
