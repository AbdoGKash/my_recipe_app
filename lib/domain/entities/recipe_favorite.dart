// lib/data/models/recipe_model.dart
import 'package:hive/hive.dart';

part 'recipe_favorite.g.dart';

@HiveType(typeId: 0)
class RecipeModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? fats;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? time;

  @HiveField(4)
  String? image;

  @HiveField(5)
  List<String>? weeks;

  @HiveField(6)
  String? carbos;

  @HiveField(7)
  String? country;

  @HiveField(8)
  String? calories;

  @HiveField(9)
  String? headline;

  @HiveField(10)
  List<String>? products;

  @HiveField(11)
  String? proteins;

  @HiveField(13)
  int? difficulty;

  @HiveField(14)
  String? description;

  @HiveField(15)
  List<String>? ingredients;

  @HiveField(16)
  List<String>? deliverableIngredients;

  RecipeModel({
    this.id,
    this.fats,
    this.name,
    this.time,
    this.image,
    this.weeks,
    this.carbos,
    this.country,
    this.calories,
    this.headline,
    this.products,
    this.proteins,
    this.difficulty,
    this.description,
    this.ingredients,
    this.deliverableIngredients,
  });
}
