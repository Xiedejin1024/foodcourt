import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../filter/filter.dart';

class DJHomeDrawer extends StatelessWidget {
  const DJHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        width: 280,
        child: Column(
          children: [
            buildDrawerView(context),
            buildDrawerItem(context, Icon(Icons.restaurant), S.of(context).dine, () {
              Navigator.of(context).pop();
            }),
            buildDrawerItem(context, Icon(Icons.filter_alt_outlined), S.of(context).filter, () {
              Navigator.of(context).pop();
              //跳转到过滤界面
              Navigator.of(context).pushNamed(DJFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.orange,
      alignment: Alignment(0, 0.5),
      margin: EdgeInsets.only(bottom: 20),
      child: Text(S.of(context).justDoIt,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget buildDrawerItem(
      BuildContext context, Widget icon, String itemText, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(itemText, style: Theme.of(context).textTheme.titleMedium),
      onTap: ()=> handler(),
    );
  }
}
