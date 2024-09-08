import 'package:flutter/material.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(recipe.name ?? AppStrings.recipeDetails),
          backgroundColor: ColorsManager.primary,
          bottom: const TabBar(
            tabs: [
              Tab(text: AppStrings.overview),
              Tab(text: AppStrings.ingredients),
              Tab(text: 'Deliverables'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Overview Tab
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  recipe.image != null
                      ? Image.network(recipe.image!, fit: BoxFit.cover)
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      recipe.name ?? AppStrings.unknownRecipe,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      recipe.description ?? AppStrings.noDescription,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  _buildDetailSection(AppStrings.time, recipe.time),
                  _buildDetailSection(AppStrings.calories, recipe.calories),
                  _buildDetailSection(AppStrings.carbs, recipe.carbos),
                  _buildDetailSection(AppStrings.proteins, recipe.proteins),
                  _buildDetailSection(AppStrings.fats, recipe.fats),
                  _buildDetailSection(
                      AppStrings.difficulty, recipe.difficulty?.toString()),
                  _buildDetailSection(AppStrings.country, recipe.country),
                  _buildDetailSection(AppStrings.headline, recipe.headline),
                ],
              ),
            ),
            // Ingredients Tab
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.ingredients,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...?recipe.ingredients?.map((ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text('• $ingredient',
                            style: const TextStyle(fontSize: 16)),
                      )),
                ],
              ),
            ),
            // Deliverables Tab
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deliverable Ingredients:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...?recipe.deliverableIngredients
                      ?.map((ingredient) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text('• $ingredient',
                                style: const TextStyle(fontSize: 16)),
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
