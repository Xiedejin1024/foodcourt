import 'package:flutter/material.dart';
import 'filter_content.dart';

class DJFilterScreen extends StatelessWidget {
  static const String routeName = "/filter";

  const DJFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          backgroundColor: Colors.orange,
        ),
        body: DJFilterContent());
  }
}
