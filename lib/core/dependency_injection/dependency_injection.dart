import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_recipe_app/data/network/api_service.dart';
import 'package:my_recipe_app/data/network/network_info.dart';
import 'package:my_recipe_app/data/repository_impl/recipr_repository_impl.dart';
import 'package:my_recipe_app/domain/repositories/recipr_repository.dart';
import 'package:my_recipe_app/domain/usecases/recipe_usecase.dart';
import 'package:my_recipe_app/presentation/home/bloc/my_recipe_bloc_bloc.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  getIt.registerLazySingleton<HomeApiService>(
      () => HomeApiService(createAndSetupDio()));

  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  getIt.registerLazySingleton<IRecipeRepository>(
      () => RecipeRepositoryImpl(getIt(), getIt()));

  getIt.registerLazySingleton<RecipeUsecase>(() => RecipeUsecase(getIt()));

  getIt.registerFactory<MyRecipeBlocBloc>(() => MyRecipeBlocBloc(getIt()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    request: true,
    responseBody: true,
  ));
  return dio;
}
