import 'package:flutter/material.dart';

class AppTheme {
  // 1.抽取相同的样式
  static const double _LargeFontSize = 22;
  static const double _MediumFontSize = 20;
  static const double _SmallFontSize = 16;


  // 2.亮色主题
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      primary: Colors.pink,
      brightness: Brightness.light,
      // primary: Colors.orange,//图标字体颜色
      background: Color.fromARGB(255, 252, 241, 209)

    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: _LargeFontSize,
      ),
      titleMedium: TextStyle(
        fontSize: _MediumFontSize,
      ),
      bodyMedium: TextStyle(fontSize: _SmallFontSize,),
    ),
  );

  // 3.暗黑主题
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.grey,
      brightness: Brightness.dark,
      primary:Colors.pink,//图标字体颜色
      primaryContainer: Colors.blue,
      secondary: Colors.pink,

    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: _LargeFontSize,
      ),
      titleMedium: TextStyle(
        fontSize: _MediumFontSize,
      ),
      bodyMedium: TextStyle(fontSize: _SmallFontSize,),
    ),
  );
}
