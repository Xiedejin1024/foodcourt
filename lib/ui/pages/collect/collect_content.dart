import 'package:flutter/material.dart';
import 'package:foodcourt/code/viewmodel/collect_viewmodel.dart';
import 'package:foodcourt/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class DJCollectContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DJCollectViewModel>(builder: (ctx, mealVM, child) {
      if (mealVM.meals.length == 0) {
        return Center(
          child: Text(S.of(context).noFavorite),
        );
      }

      return ListView.builder(
          itemCount: mealVM.meals.length,
          itemBuilder: (ctx, index) {
            return DJMealItem(mealVM.meals[index]);
          });
    });
  }
}
