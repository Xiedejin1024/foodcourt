import 'package:flutter/material.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';

import '../../../code/model/meal_model.dart';
import '../../../generated/l10n.dart';

class DJDetailContent extends StatelessWidget {
  final DJMealModel _meal;

  DJDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(S.of(context).materials),
          buildMaterial(context),
          buildMakeTitle(S.of(context).step),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  Widget buildMaterial(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.px),
     decoration: BoxDecoration(
       color: Colors.white54,
           border: Border.all(color: Colors.black12),
           borderRadius: BorderRadius.circular(8.px)
     ),
     width: MediaQuery.of(context).size.width-30.px,
      child: ListView.builder(
        shrinkWrap: true,//范围性包裹内容，
          physics: NeverScrollableScrollPhysics(),//设置内容不滚动
        itemCount: _meal.ingredients.length,
          itemBuilder: (ctx,index){
            return Card(
              color: Colors.orangeAccent,

              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.px,horizontal: 10.px),
                child: Text(_meal.ingredients[index]),
              )
            );
          }
      ),
    );
  }

  Widget buildMakeSteps(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10.px),
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color:  Colors.white54,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8.px)
      ),
      width: MediaQuery.of(context).size.width-30.px,
      child: ListView.separated(
          shrinkWrap: true,//范围性包裹内容，
          physics: NeverScrollableScrollPhysics(),//设置内容不滚动
          itemCount: _meal.steps.length,
          itemBuilder: (ctx,index){
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                child: Text("#${index+1}"),
              ),
              title: Text(_meal.steps[index]),
            );
          },
          separatorBuilder: (context,index){
            return Divider();
          },
      ),
    );
  }

  Widget buildMakeTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title,style: TextStyle(fontSize: 25),),
    );
  }
}
