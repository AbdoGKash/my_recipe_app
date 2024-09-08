import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/helper/images_assets.dart';
import 'package:my_recipe_app/core/routing/routers_name.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';
import 'package:my_recipe_app/domain/entities/recipe_favorite.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<RecipeModel>(AppStrings.favorites).listenable(),
      builder: (BuildContext context, Box<RecipeModel> box, Widget? child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.9,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            final isFavorite = box.containsKey(index);
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutersName.recipeDetilsScreen,
                  arguments: recipe,
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  children: [
                    // Image of the recipe
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Image.network(
                        recipe.image ?? '',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Favorite Icon
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        onPressed: () async {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          if (isFavorite) {
                            await box.delete(index);

                            snakBar(context, ImagesAssets.deleteLottie,
                                AppStrings.recipeRemoved);
                          } else {
                            await box.put(
                                index,
                                RecipeModel(
                                  name: recipe.name,
                                  image: recipe.image,
                                  calories: recipe.calories,
                                  id: recipe.id,
                                  ingredients: recipe.ingredients,
                                  products: recipe.products,
                                  description: recipe.description,
                                  difficulty: recipe.difficulty,
                                  time: recipe.time,
                                  headline: recipe.headline,
                                  weeks: recipe.weeks,
                                  country: recipe.country,
                                  proteins: recipe.proteins,
                                  carbos: recipe.carbos,
                                  fats: recipe.fats,
                                ));
                            snakBar(context, ImagesAssets.doneLottie,
                                AppStrings.recipeAdded);
                          }
                        },
                        icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: ColorsManager.white),
                      ),
                    ),

                    // Title and Description
                    Positioned(
                      bottom: 6,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${recipe.name}  ${recipe.calories}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

snakBar(BuildContext context, String imageName, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: TextStyles.font16WhiteSemiBold,
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: Lottie.asset(imageName),
        )
      ],
    ),
    backgroundColor: ColorsManager.black.withOpacity(0.8),
    duration: const Duration(seconds: 2),
  ));
}
