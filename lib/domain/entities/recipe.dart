class Recipe {
  String? id;
  String? fats;
  String? name;
  String? time;
  String? image;
  List<String>? weeks;
  String? carbos;
  String? country;
  String? calories;
  String? headline;
  List<String>? products;
  String? proteins;
  int? favorites;
  int? difficulty;
  String? description;
  List<String>? ingredients;
  List<String>? deliverableIngredients;

  Recipe(
      {this.id,
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
      this.favorites,
      this.difficulty,
      this.description,
      this.ingredients,
      this.deliverableIngredients});
}
