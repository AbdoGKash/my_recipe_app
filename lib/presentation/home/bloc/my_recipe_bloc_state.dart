part of 'my_recipe_bloc_bloc.dart';

@immutable
sealed class MyRecipeBlocState {}

final class MyRecipeBlocInitial extends MyRecipeBlocState {}

class MyRecipeBlocLoading extends MyRecipeBlocState {}

class MyRecipeBlocLoaded extends MyRecipeBlocState {
  final List<Recipe> recipes;
  MyRecipeBlocLoaded({required this.recipes});
}

class MyRecipeBlocError extends MyRecipeBlocState {
  final String message;
  MyRecipeBlocError({required this.message});
}
