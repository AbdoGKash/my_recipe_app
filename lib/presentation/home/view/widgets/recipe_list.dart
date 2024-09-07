import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/helper/images_assets.dart';
import 'package:my_recipe_app/core/routing/routers_name.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';
import 'package:my_recipe_app/domain/entities/recipe.dart';

class RecipeList extends StatefulWidget {
  final List<Recipe> recipes;
  const RecipeList({super.key, required this.recipes});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutersName.recipeDetilsScreen,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0).w,
              child: GridTile(
                footer: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
                  color: ColorsManager.primary,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget.recipes[index].name,
                                style: TextStyles.font25WhiteBold),
                            TextSpan(
                                text: 'Abdo',
                                style: TextStyles.font14WhiteSemiBold),
                            TextSpan(
                                text: 'Abdo',
                                style: TextStyles.font14WhiteSemiBold),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                child: Container(
                  color: ColorsManager.grey,
                  child: FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: ImagesAssets.googleSvg,
                    image: ImagesAssets.googleSvg,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
