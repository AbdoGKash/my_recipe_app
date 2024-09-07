import 'package:dio/dio.dart';
import 'package:my_recipe_app/data/network/api_constants.dart';
import 'package:my_recipe_app/data/response/recipe_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.home)
  Future<List<RecipeResponseModel>> getRecipe();
}
