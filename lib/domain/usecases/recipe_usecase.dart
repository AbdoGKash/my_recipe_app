import 'package:dartz/dartz.dart';
import 'package:my_recipe_app/data/network/api_error_model.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';
import 'package:my_recipe_app/domain/repositories/recipr_repository.dart';

class RecipeUsecase {
  final IRecipeRepository _recipeRepository;
  RecipeUsecase(this._recipeRepository);
  Future<Either<ApiErrorModel, List<Recipe>>> getRecipes() async {
    return await _recipeRepository.getRecipes();
  }
}
