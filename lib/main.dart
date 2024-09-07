import 'package:flutter/material.dart';
import 'package:my_recipe_app/core/dependency_injection/dependency_injection.dart';
import 'package:my_recipe_app/my_recipe_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MyRecipeApp());
}
