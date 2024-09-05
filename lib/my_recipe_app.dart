import 'package:flutter/material.dart';
import 'package:my_recipe_app/core/routing/routers_name.dart';
import 'core/routing/app_router.dart';

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutersName.loginSreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
