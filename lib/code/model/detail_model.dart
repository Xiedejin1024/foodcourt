// To parse this JSON data, do
//
//     final djDetailModel = djDetailModelFromJson(jsonString);

import 'dart:convert';

DJDetailModel DJDetailModelFromJson(String str) => DJDetailModel.fromJson(json.decode(str));

String DJDetailModelToJson(DJDetailModel data) => json.encode(data.toJson());

class DJDetailModel {
  List<Meal> meal;

  DJDetailModel({
    required this.meal,
  });

  factory DJDetailModel.fromJson(Map<String, dynamic> json) => DJDetailModel(
    meal: List<Meal>.from(json["meal"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meal": List<dynamic>.from(meal.map((x) => x.toJson())),
  };
}

class Meal {
  String id;
  List<String> categories;
  String title;
  int affordability;
  int complexity;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    id: json["id"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    title: json["title"],
    affordability: json["affordability"],
    complexity: json["complexity"],
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


}
