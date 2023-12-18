import 'package:flutter/material.dart';
import 'package:foodcourt/code/viewmodel/filter_viewmodel.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';

class DJFilterContent extends StatelessWidget {
  const DJFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildChoiceTitle(context), buildChoiceItems(context)],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(S.of(context).showChoice,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget buildChoiceItems(BuildContext context) {
    return Expanded(
      child: Consumer<DJFilterViewModel>(
        builder: (ctx, filterVM, child) {
          return ListView(
            children: [
              buildListItems(context, S.of(context).glutenFree, S.of(context).showGlutenFree,filterVM.isGlutenFree,(value){
                filterVM.isGlutenFree=value;
              }),
              buildListItems(context, S.of(context).lactoseFree, S.of(context).showLactoseFree, filterVM.isLactoseFree,(value){
                filterVM.isLactoseFree=value;
              }),
              buildListItems(context, S.of(context).vegetarian, S.of(context).showVegetarian, filterVM.isVegetarian, (value){
                filterVM.isVegetarian=value;
              }),
              buildListItems(context, S.of(context).vegan, S.of(context).showVegan,filterVM.isVegan, (value){
                filterVM.isVegan=value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListItems(
      BuildContext context,
      String title, String
      subTitle, bool value,
      ValueChanged<bool> onChange) {//采用Function时要返回的参数不支持，所以使用里面的类
        return ListTile(
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(subTitle,style: TextStyle(color: Colors.grey),),
          trailing: Switch(
              activeColor: Colors.red,
              value: value,
              onChanged:onChange), //尾部部分
        );
  }
}
