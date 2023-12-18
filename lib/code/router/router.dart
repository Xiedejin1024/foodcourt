import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/detail/detail.dart';
import 'package:foodcourt/ui/pages/meal/meal.dart';

import '../../ui/pages/filter/filter.dart';
import '../../ui/pages/main/main.dart';

class DJRouter {
  static const String initRouter = DJMainScreen.routeName;

  static final Map<String, WidgetBuilder> routers = {
    DJMainScreen.routeName: (ctx) => DJMainScreen(),
    DJMealScreen.routeName: (ctx) => DJMealScreen(),
    DJDetailScreen.routeName: (ctx) => DJDetailScreen(),
    DJFilterScreen.routeName: (ctx) => DJFilterScreen(),
  };

  static final RouteFactory generateRoute = (settings) {
    // if(settings.name==DJFilterScreen.routeName){
    //   return MaterialPageRoute(builder: (ctx){
    //     return DJFilterScreen();
    //   },
    //   fullscreenDialog: true);
    // }

    return null;
  };

  static final RouteFactory unKnownRoute = (settings) {
    return null;
  };
}
