import 'package:my_recipe_app/domain/entities/recipe.dart';
import 'package:my_recipe_app/data/response/recipe_response_model.dart';

class RecipeMapper {
  static Recipe toEntity(RecipeResponseModel responseModel) {
    return Recipe(
      id: responseModel.id,
      fats: responseModel.fats,
      name: responseModel.name,
      time: responseModel.time,
      image: responseModel.image,
      weeks: responseModel.weeks,
      carbos: responseModel.carbos,
      country: responseModel.country,
      calories: responseModel.calories,
      headline: responseModel.headline,
      products: responseModel.products,
      proteins: responseModel.proteins,
      favorites: responseModel.favorites,
      difficulty: responseModel.difficulty,
      description: responseModel.description,
      ingredients: responseModel.ingredients,
      deliverableIngredients: responseModel.deliverableIngredients,
    );
  }

  static List<Recipe> toEntityList(List<RecipeResponseModel> responseModels) {
    return responseModels
        .map((responseModel) => toEntity(responseModel))
        .toList();
  }
}
