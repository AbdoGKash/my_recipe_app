import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/theming/colors.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.primary,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.ligtherGrey,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: TextStyles.font18primaryBold,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: ColorsManager.ligtherGrey,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font18primaryBold,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
