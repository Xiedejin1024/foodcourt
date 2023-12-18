import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodcourt/code/router/router.dart';
import 'package:foodcourt/code/viewmodel/collect_viewmodel.dart';
import 'package:foodcourt/code/viewmodel/filter_viewmodel.dart';
import 'package:foodcourt/code/viewmodel/meal_viewmodel.dart';
import 'package:foodcourt/ui/shared/app_theme.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

import 'code/services/meal_request.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (ctx) => DJFilterViewModel()),
      // ChangeNotifierProvider(create: (ctx) => DJMealViewModel()),
      // ChangeNotifierProvider(create: (ctx) => DJCollectViewModel()),


      //DJMealViewModel要依赖DJFilterViewModel中的状态进行筛选，采用代理（ProxyProvider）来进行
      ChangeNotifierProvider(create: (ctx) => DJFilterViewModel()),
      ChangeNotifierProxyProvider<DJFilterViewModel, DJMealViewModel>(
        create: (ctx) => DJMealViewModel(),
        update: (ctx, filterVM, mealVM) {
          if (mealVM == null) throw ArgumentError.notNull('DJMealViewModel');
          mealVM.updateFilters(filterVM);
          return mealVM;
        },
      ),
      ChangeNotifierProxyProvider<DJFilterViewModel, DJCollectViewModel>(
        create: (ctx) => DJCollectViewModel(),
        update: (ctx, filterVM, collectVM) {
          if (collectVM == null) throw ArgumentError.notNull('DJCollectViewModel');
          collectVM.updateFilters(filterVM);
          return collectVM;
        },
      ),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DJSizeFit.initialize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: DJRouter.initRouter,
      routes: DJRouter.routers,
      onGenerateRoute: DJRouter.generateRoute,
      onUnknownRoute: DJRouter.unKnownRoute,
      //完成国际化的初始化
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
    );
  }
}
