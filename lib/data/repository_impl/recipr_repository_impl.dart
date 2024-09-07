import 'package:dartz/dartz.dart';
import 'package:my_recipe_app/data/mapper/RecipeMapper.dart';
import 'package:my_recipe_app/data/network/api_error_handler.dart';
import 'package:my_recipe_app/data/network/api_error_model.dart';
import 'package:my_recipe_app/data/network/api_service.dart';
import 'package:my_recipe_app/data/network/network_info.dart';
import 'package:my_recipe_app/data/response/recipe_response_model.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';
import 'package:my_recipe_app/domain/repositories/recipr_repository.dart';

class RecipeRepositoryImpl implements IRecipeRepository {
  final HomeApiService _apiService;
  final NetworkInfo _networkInfo;
  RecipeRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<ApiErrorModel, List<Recipe>>> getRecipes() async {
    if (await _networkInfo.isConnected) {
      try {
        final List<RecipeResponseModel> response =
            await _apiService.getRecipe();

        final List<Recipe> recipeEntities = RecipeMapper.toEntityList(response);

        return Right(recipeEntities);
      } catch (error) {
        final ErrorHandler errorHandler = ErrorHandler.handle(error);
        return Left(errorHandler.apiErrorModel);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
