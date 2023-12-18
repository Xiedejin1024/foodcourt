import 'package:flutter/material.dart';

import '../collect/collect.dart';
import '../home/home.dart';

final List<Widget> pages=[
  DJHomePage(),
  DJCollectPage(),
];

final List<BottomNavigationBarItem> items=[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
  BottomNavigationBarItem(icon: Icon(Icons.collections), label: "收藏")
];