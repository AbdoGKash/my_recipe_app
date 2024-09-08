import 'package:json_annotation/json_annotation.dart';
part 'recipe_response_model.g.dart';

@JsonSerializable()
class RecipeResponseModel {
  String? id;
  String? fats;
  String? name;
  String? time;
  String? image;
  List<String>? weeks;
  String? carbos;
  String? fibers;
  int? rating;
  String? country;
  int? ratings;
  String? calories;
  String? headline;
  List<String>? keywords;
  List<String>? products;
  String? proteins;
  int? favorites;
  int? difficulty;
  String? description;
  bool? highlighted;
  List<String>? ingredients;
  String? incompatibilities;
  @JsonKey(
      name:
          'deliverable_ingredients') // Because there is a difference between the naming method in dart and api
  List<String>? deliverableIngredients;
  @JsonKey(
      name:
          'undeliverable_ingredients') // Because there is a difference between the naming method in dart and api
  List? undeliverableIngredients;

  RecipeResponseModel(
      {this.id,
      this.fats,
      this.name,
      this.time,
      this.image,
      this.weeks,
      this.carbos,
      this.fibers,
      this.rating,
      this.country,
      this.ratings,
      this.calories,
      this.headline,
      this.keywords,
      this.products,
      this.proteins,
      this.favorites,
      this.difficulty,
      this.description,
      this.highlighted,
      this.ingredients,
      this.incompatibilities,
      this.deliverableIngredients,
      this.undeliverableIngredients});

  factory RecipeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseModelFromJson(json);
}
