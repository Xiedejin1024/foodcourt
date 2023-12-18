// To parse this JSON data, do
//
//     final djMealModel = djMealModelFromJson(jsonString);

import 'dart:convert';

DJMealModel DJMealModelFromJson(String str) => DJMealModel.fromJson(json.decode(str));

String DJMealModelToJson(DJMealModel data) => json.encode(data.toJson());

List<String> comples=["简单","一般","困难"];

class DJMealModel {
  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String complexityStr;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  DJMealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    this.complexityStr="",
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  factory DJMealModel.fromJson(Map<String, dynamic> json) => DJMealModel(
    id: json["id"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    title: json["title"],
    affordability: json["affordability"],
    complexity: json["complexity"],
    complexityStr: comples[json["complexity"]],
    imageUrl: json["imageUrl"],
    duration: json["duration"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    steps: List<String>.from(json["steps"].map((x) => x)),
    isGlutenFree: json["isGlutenFree"],
    isVegan: json["isVegan"],
    isVegetarian: json["isVegetarian"],
    isLactoseFree: json["isLactoseFree"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "title": title,
    "affordability": affordability,
    "complexity": complexity,
    "imageUrl": imageUrl,
    "duration": duration,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "steps": List<dynamic>.from(steps.map((x) => x)),
    "isGlutenFree": isGlutenFree,
    "isVegan": isVegan,
    "isVegetarian": isVegetarian,
    "isLactoseFree": isLactoseFree,
  };

  @override
  String toString() {
    return 'DJMealModel{id: $id, categories: $categories, title: $title, affordability: $affordability, complexity: $complexity, imageUrl: $imageUrl, duration: $duration, ingredients: $ingredients, steps: $steps, isGlutenFree: $isGlutenFree, isVegan: $isVegan, isVegetarian: $isVegetarian, isLactoseFree: $isLactoseFree}';
  }
}
