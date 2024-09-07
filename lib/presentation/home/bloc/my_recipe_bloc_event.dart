part of 'my_recipe_bloc_bloc.dart';

@immutable
sealed class MyRecipeBlocEvent {}

class GetMyRecipesEvent extends MyRecipeBlocEvent {}
