import 'package:flutter/material.dart';
import 'package:foodcourt/code/model/category_model.dart';
import 'package:foodcourt/code/viewmodel/meal_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../../../code/model/meal_model.dart';
import '../../widgets/meal_item.dart';

class DJMealContent extends StatelessWidget {
  DJCategoryModel category;

  DJMealContent(this.category);


  @override
  Widget build(BuildContext context) {
    return Selector<DJMealViewModel, List<DJMealModel>>(
      shouldRebuild: (previous, next) => ! ListEquality().equals(previous, next),
      selector: (ctx, mealVM) => mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList(),
      builder: (ctx, meals, child) {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return DJMealItem(meals[index]);
            });
      },
    );

    //   return Consumer<DJMealViewModel>(
    //       builder: (ctx, mealVM, child) {
    //     final meals = mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList();
    //     return ListView.builder(
    //         itemCount: meals.length,
    //         itemBuilder: (ctx, index) {
    //           return ListTile(title: Text("${meals[index].title}"),);
    //         });
    //   });
    //
    // }
  }
}
