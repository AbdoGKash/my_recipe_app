import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';

class CustomButtom extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButtom({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: 65.h,
        minWidth: 350.w,
        onPressed: onPressed,
        color: ColorsManager.primary,
        child: Text(
          AppStrings.login,
          style: TextStyles.font20WhiteBold,
        ),
      ),
    );
  }
}
