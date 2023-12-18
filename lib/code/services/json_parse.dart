
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodcourt/code/model/category_model.dart';

class JsonParse{
  static Future<List<DJCategoryModel>> getCategoryData() async{
    //获取json数据
    final jsonString=await rootBundle.loadString("assets/json/category.json");
    //降数据转成Map/list
    final result=jsonDecode(jsonString);

    final resultList=result["category"];

    List<DJCategoryModel> categories=[];
    for(var json in resultList ){
      categories.add(DJCategoryModel.fromJson(json));
    }
    return categories;


  }
}