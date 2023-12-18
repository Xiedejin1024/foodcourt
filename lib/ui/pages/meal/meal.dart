
import 'package:flutter/material.dart';
import 'package:foodcourt/code/model/category_model.dart';

import 'meal_content.dart';

class DJMealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {

    final category=ModalRoute.of(context)?.settings.arguments as DJCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.title}"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:DJMealContent(category)
    );
  }
}
