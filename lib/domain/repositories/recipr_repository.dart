import 'package:dartz/dartz.dart';
import 'package:my_recipe_app/data/network/api_error_model.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';

abstract class IRecipeRepository {
  Future<Either<ApiErrorModel, Recipe>> getRecipes();
}
