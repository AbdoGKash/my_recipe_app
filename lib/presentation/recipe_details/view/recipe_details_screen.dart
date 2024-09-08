import 'package:flutter/material.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(recipe.name ?? 'Recipe Details'),
          backgroundColor: Colors.deepOrange,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Ingredients'),
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
                      recipe.name ?? 'Unknown Recipe',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      recipe.description ?? 'No description available.',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  _buildDetailSection('Time', recipe.time),
                  _buildDetailSection('Calories', recipe.calories),
                  _buildDetailSection('Carbs', recipe.carbos),
                  _buildDetailSection('Proteins', recipe.proteins),
                  _buildDetailSection('Fats', recipe.fats),
                  _buildDetailSection(
                      'Difficulty', recipe.difficulty?.toString()),
                  _buildDetailSection('Country', recipe.country),
                  _buildDetailSection('Headline', recipe.headline),
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
                    'Ingredients:',
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
            value ?? 'N/A',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
