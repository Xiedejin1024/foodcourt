
import 'package:flutter/material.dart';
import 'package:foodcourt/ui/pages/collect/collect_content.dart';

import '../../../generated/l10n.dart';

class DJCollectPage extends StatelessWidget {
  const DJCollectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myFavorite),
        backgroundColor: Colors.pink,
      ),
      body:DJCollectContent()
    );
  }
}
