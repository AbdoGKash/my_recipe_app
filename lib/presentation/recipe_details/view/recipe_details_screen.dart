import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';
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
              Tab(text: AppStrings.deliverables),
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
                      padding: const EdgeInsets.all(16.0).w,
                      child: Text(recipe.name ?? AppStrings.unknownRecipe,
                          style: TextStyles.font25GreyBold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
                    child: Text(
                      recipe.description ?? AppStrings.noDescription,
                      style: TextStyle(fontSize: 16.sp),
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
              padding: const EdgeInsets.all(16.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.ingredients,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  ...?recipe.ingredients?.map((ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0).w,
                        child: Text('• $ingredient',
                            style: TextStyle(fontSize: 16.sp)),
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
                  Text(
                    AppStrings.deliverableIngredients,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  ...?recipe.deliverableIngredients
                      ?.map((ingredient) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text('• $ingredient',
                                style: TextStyle(fontSize: 16.sp)),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(),
            style: value == recipe.headline
                ? TextStyle(fontSize: 12.sp)
                : TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
