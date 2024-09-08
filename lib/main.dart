import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_recipe_app/core/dependency_injection/dependency_injection.dart';
import 'package:my_recipe_app/domain/entities/recipe_favorite.dart';
import 'package:my_recipe_app/my_recipe_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeModelAdapter());
  await Hive.openBox<RecipeModel>("Favorite");
  await initGetIt();
  runApp(const MyRecipeApp());
}
