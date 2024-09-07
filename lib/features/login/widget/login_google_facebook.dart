import 'package:flutter/material.dart';
import 'package:my_recipe_app/core/helper/images_assets.dart';
import 'package:svg_flutter/svg.dart';

class LoginGoogleFacebook extends StatelessWidget {
  const LoginGoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.center, child: Text("or sign up with")),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesAssets.googleSvg),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(ImagesAssets.facebookSvg)
          ],
        ),
      ],
    );
  }
}
