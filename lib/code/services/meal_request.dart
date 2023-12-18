import 'package:foodcourt/code/model/meal_model.dart';

import 'http_request.dart';

class MealRequest {
  static Future<List<DJMealModel>> getMealData() async {
    final reslut = await HttpRequest.request("/meal.json");
    final mealArr=reslut["meal"];
    List<DJMealModel> meals=[];
    for(var json in mealArr ){
      meals.add(DJMealModel.fromJson(json));
    }
    return meals;
  }
}
