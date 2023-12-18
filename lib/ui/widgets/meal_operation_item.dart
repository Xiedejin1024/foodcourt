import 'package:flutter/material.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';

class DJOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _text;

  DJOperationItem(this._icon, this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.px,
      padding: EdgeInsets.symmetric(vertical: 16.px,horizontal: 6.px),
      child: Row(
        children: [
          _icon,
          SizedBox(
            width: 5.px,
          ),
          Text(_text)
        ],
      ),
    );
  }
}
