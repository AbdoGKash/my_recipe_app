import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/helper/images_assets.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';
import 'package:my_recipe_app/domain/entities/recipe_favorite.dart';
import 'package:my_recipe_app/presentation/home/view/widgets/recipe_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.favorites, style: TextStyles.font25WhiteBold),
        centerTitle: true,
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: ColorsManager.white),
      ),
      body: ValueListenableBuilder(
        valueListenable:
            Hive.box<RecipeModel>(AppStrings.favorites).listenable(),
        builder: (context, box, child) {
          final keys = box.keys.toList();
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.9,
            ),
            itemCount: keys.length,
            itemBuilder: (BuildContext context, int index) {
              final key = keys[index];
              final favoriteItem = box.get(key);
              return Card(
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
                        favoriteItem!.image.toString(),
                        height: 120.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Favorite Icon
                    IconButton(
                      onPressed: () async {
                        await box.delete(key);
                        snakBar(context, ImagesAssets.deleteLottie,
                            AppStrings.recipeRemoved);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: ColorsManager.white,
                      ),
                    ),
                    // Title and Description
                    Positioned(
                      bottom: 6,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Text(
                          "${favoriteItem.name}  ${favoriteItem.calories}",
                          style: TextStyles.font14GrayBold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
