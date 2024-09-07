import 'package:flutter/material.dart';
import 'package:my_recipe_app/presentation/home/view/home_screen.dart';
import 'package:my_recipe_app/presentation/recipe_details/view/recipe_details_screen.dart';
import '../../presentation/login/view/login_screen.dart';
import 'routers_name.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersName.loginSreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RoutersName.homeSreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RoutersName.recipeDetilsScreen:
        return MaterialPageRoute(
          builder: (_) => const RecipeDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          ),
        );
    }
  }
}
