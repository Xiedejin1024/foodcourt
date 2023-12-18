import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/main/init_items.dart';

import '../../../generated/l10n.dart';
import '../home/home_drawer.dart';

class DJMainScreen extends StatefulWidget {
  static const String routeName = "/";

  const DJMainScreen({super.key});

  @override
  State<DJMainScreen> createState() => _DJMainScreenState();
}

class _DJMainScreenState extends State<DJMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      drawer: DJHomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: S.of(context).home),
          BottomNavigationBarItem(icon: Icon(Icons.collections), label: S.of(context).favorite)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
