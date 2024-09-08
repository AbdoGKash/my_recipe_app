import 'package:flutter/material.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import '../../../../core/theming/text_styel.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: AppStrings.doNotHaveAccount,
                style: TextStyles.font13GreykW300),
            TextSpan(text: AppStrings.signUp, style: TextStyles.font13BlackBold)
          ])),
    );
  }
}
