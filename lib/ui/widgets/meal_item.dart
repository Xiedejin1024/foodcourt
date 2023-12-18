import 'package:flutter/material.dart';
import 'package:foodcourt/code/model/meal_model.dart';
import 'package:foodcourt/code/viewmodel/collect_viewmodel.dart';
import 'package:foodcourt/ui/pages/detail/detail.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';
import 'package:foodcourt/ui/widgets/meal_operation_item.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class DJMealItem extends StatelessWidget {
  final DJMealModel _meal;

  DJMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [buildBasiceInfo(),
            buildOperationInfo(context)],
        ),
      ),
      onTap: () => Navigator.of(context)
          .pushNamed(DJDetailScreen.routeName, arguments: _meal),
    );
  }

  Widget buildBasiceInfo() {
    return Stack(
      children: [
        ClipRRect(
          child: Image.network(
            _meal.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.px),
            topRight: Radius.circular(12.px),
          ),
        ),
        Positioned(
          bottom: 10.px,
          right: 10.px,
          child: Container(
            width: 250.px,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(6.px)),
            child: Text(
              "${_meal.title}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DJOperationItem(Icon(Icons.schedule), "${_meal.duration}${S.of(context).minutes}"),
        DJOperationItem(Icon(Icons.restaurant), "${_meal.complexityStr}"),
        buildCollectItem(),
      ],
    );
  }

  Widget buildCollectItem() {
    return Consumer<DJCollectViewModel>(builder: (context, collectVM, child) {
      final iconData =
          collectVM.isCollect(_meal) ? Icons.favorite : Icons.favorite_border;
      final iconColor = collectVM.isCollect(_meal) ? Colors.red : Colors.black;
      final collectStr = collectVM.isCollect(_meal) ? S.of(context).collected : S.of(context).favorite ;
      return GestureDetector(
        child: DJOperationItem(Icon(iconData, color: iconColor), collectStr),
        onTap: () {
          collectVM.handleMeal(_meal);
        },
      );
    });
  }
}
