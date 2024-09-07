import 'package:my_recipe_app/data/response/recipe_response_model.dart';

import '../../domain/entities/recipe.dart';

class RecipeMapper {
  static Recipe toEntity(RecipeResponseModel model) {
    return Recipe(
      id: model.id,
      fats: model.fats,
      name: model.name,
      time: model.time,
      image: model.image,
      weeks: model.weeks,
      carbos: model.carbos,
      country: model.country,
      calories: model.calories,
      headline: model.headline,
      products: model.products,
      proteins: model.proteins,
      favorites: model.favorites,
      difficulty: model.difficulty,
      description: model.description,
      ingredients: model.ingredients,
      deliverableIngredients: model.deliverableIngredients,
    );
  }

  static RecipeResponseModel toModel(Recipe entity) {
    return RecipeResponseModel(
      id: entity.id,
      fats: entity.fats,
      name: entity.name,
      time: entity.time,
      image: entity.image,
      weeks: entity.weeks,
      carbos: entity.carbos,
      country: entity.country,
      calories: entity.calories,
      headline: entity.headline,
      products: entity.products,
      proteins: entity.proteins,
      favorites: entity.favorites,
      difficulty: entity.difficulty,
      description: entity.description,
      ingredients: entity.ingredients,
      deliverableIngredients: entity.deliverableIngredients,
    );
  }
}
