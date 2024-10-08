import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/routing/routers_name.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';
import 'package:my_recipe_app/presentation/home/bloc/my_recipe_bloc_bloc.dart';
import 'package:my_recipe_app/presentation/home/view/widgets/recipe_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.recipes, style: TextStyles.font25WhiteBold),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutersName.favoriteSreen);
              },
              icon: Icon(
                Icons.favorite,
                color: ColorsManager.white,
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: ColorsManager.primary,
        iconTheme: IconThemeData(color: ColorsManager.white),
      ),
      body: BlocBuilder<MyRecipeBlocBloc, MyRecipeBlocState>(
        builder: (context, state) {
          if (state is MyRecipeBlocLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MyRecipeBlocLoaded) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20).w,
              child: RecipeList(
                recipes: state.recipes,
              ),
            );
          } else if (state is MyRecipeBlocError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
