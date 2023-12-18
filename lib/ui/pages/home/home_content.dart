import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/meal/meal.dart';

import '../../../code/model/category_model.dart';
import '../../../code/services/json_parse.dart';

class DJHomeContent extends StatefulWidget {
  const DJHomeContent({super.key});

  @override
  State<DJHomeContent> createState() => _DJHomeContentState();
}

class _DJHomeContentState extends State<DJHomeContent> {
  List<DJCategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();

    JsonParse.getCategoryData().then((value) {
      setState(() {
        _categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(20),
        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (ctx, index) {
         final bgColor= _categories[index].finalColor;

          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color:bgColor,
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                    colors: [
                      bgColor.withOpacity(0.5),
                      bgColor
                    ]

                ),
              ),

              alignment: Alignment.center,
              child: Text("${_categories[index].title}",style: TextStyle(fontSize: 20),),
            ),
            onTap: (){
              Navigator.of(context).pushNamed(DJMealScreen.routeName,arguments: _categories[index]);
            }
          );
        });
  }
}
