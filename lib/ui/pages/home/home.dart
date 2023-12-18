import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/home/home_content.dart';
import 'package:foodcourt/ui/pages/home/home_drawer.dart';

import '../../../generated/l10n.dart';

class DJHomePage extends StatelessWidget {
  const DJHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).favorcate),
            backgroundColor: Colors.pink,
            // backgroundColor: Colors.pink,
            //这样的方式全局显示，不会出现底部的按钮，
          leading:IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }
          )

          //这样的方式无法全局显示，会出现底部的按钮，
          // //自定义图标的方式，采用了自定义，无法弹出Drawer，如下：（需要自己控制弹出）
          // leading: Builder(
          //   builder: (ctx) {//需要取Scaffold的上下文才起作用
          //     return IconButton(
          //       icon: Icon(Icons.settings),
          //       onPressed: () {
          //         Scaffold.of(ctx).openDrawer();
          //       }
          //     );
          //   },
          // ),
        ),
        body: DJHomeContent());
  }
}
