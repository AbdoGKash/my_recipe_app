import 'package:flutter/material.dart';
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
                text: 'do not have an account?',
                style: TextStyles.font13GreykW300),
            TextSpan(text: 'sign up', style: TextStyles.font13BlackBold)
          ])),
    );
  }
}
