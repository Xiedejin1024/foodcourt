import 'dart:ui';

class DJCategoryModel {
  String? id;
  String? title;
  String? color;
  Color finalColor=Color(0xFF000000);


  DJCategoryModel({this.id, this.title, this.color});

  DJCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    //将color转成16进制
    int colorInt=int.parse(color!,radix: 16);
    //装成带透明度的字符串颜色值
    finalColor=Color(colorInt|0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }

  @override
  String toString() {
    return 'DJCategoryModel{id: $id, title: $title, color: $color}';
  }
}