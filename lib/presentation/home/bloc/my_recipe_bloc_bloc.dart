import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe_app/data/network/api_error_handler.dart';
import 'package:my_recipe_app/data/network/api_error_model.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';
import 'package:my_recipe_app/domain/usecases/recipe_usecase.dart';

part 'my_recipe_bloc_event.dart';
part 'my_recipe_bloc_state.dart';

class MyRecipeBlocBloc extends Bloc<MyRecipeBlocEvent, MyRecipeBlocState> {
  final RecipeUsecase recipeUsecase;
  MyRecipeBlocBloc(this.recipeUsecase) : super(MyRecipeBlocInitial()) {
    on<MyRecipeBlocEvent>((event, emit) async {
      if (event is GetMyRecipesEvent) {
        emit(MyRecipeBlocLoading());
        final Either<ApiErrorModel, List<Recipe>> result =
            await recipeUsecase.getRecipes();
        result.fold(
          (error) => emit(MyRecipeBlocError(
              message: error.message ?? ResponseMessage.DEFAULT)),
          (recipes) => emit(MyRecipeBlocLoaded(recipes: recipes)),
        );
      }
    });
  }
}
