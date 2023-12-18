import 'package:flutter/material.dart';
import 'package:foodcourt/code/model/meal_model.dart';
import 'package:foodcourt/code/viewmodel/collect_viewmodel.dart';
import 'package:provider/provider.dart';

import 'detail_content.dart';

class DJDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";

  const DJDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as DJMealModel;
    return Scaffold(
        appBar: AppBar(
          title: Text("${meal.title}"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: DJDetailContent(meal),
        floatingActionButton: Consumer<DJCollectViewModel>(
          builder: (context, collectVM, child) {
            final iconData = collectVM.isCollect(meal) ? Icons.favorite : Icons.favorite_border;
            final iconColor = DJCollectViewModel().isCollect(meal) ? Colors.black : Colors.red;
            return FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(iconData,color: iconColor),
              onPressed: () {
                collectVM.handleMeal(meal);
              },
            );
          },
        ));
  }
}
