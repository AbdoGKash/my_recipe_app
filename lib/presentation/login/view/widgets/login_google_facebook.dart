import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/helper/images_assets.dart';
import 'package:svg_flutter/svg.dart';

class LoginGoogleFacebook extends StatelessWidget {
  const LoginGoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.center, child: Text(AppStrings.orSignUp)),
        SizedBox(
          height: 25.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesAssets.googleSvg),
            SizedBox(
              width: 20.w,
            ),
            SvgPicture.asset(ImagesAssets.facebookSvg)
          ],
        ),
      ],
    );
  }
}
