import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/dependency_injection/dependency_injection.dart';
import 'package:my_recipe_app/core/routing/routers_name.dart';
import 'package:my_recipe_app/presentation/home/bloc/my_recipe_bloc_bloc.dart';
import 'core/routing/app_router.dart';

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        child: BlocProvider(
          create: (context) =>
              getIt<MyRecipeBlocBloc>()..add(GetMyRecipesEvent()),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutersName.loginSreen,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ));
  }
}
