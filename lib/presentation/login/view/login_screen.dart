import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/helper/app_strings.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';
import 'package:my_recipe_app/presentation/login/view/widgets/dont_have_account_text.dart';
import 'package:my_recipe_app/presentation/login/view/widgets/email_and_password.dart';
import 'package:my_recipe_app/presentation/login/view/widgets/login_google_facebook.dart';
import 'package:my_recipe_app/presentation/login/view/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.wlcomeBack,
                  style: TextStyles.font25primaryBold,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  AppStrings.welcomeDescription,
                  style: TextStyles.font14Gray200,
                ),
                SizedBox(
                  height: 36.h,
                ),
                const EmailAndPassword(),
                SizedBox(
                  height: 50.h,
                ),
                const TermsAndConditionsText(),
                SizedBox(
                  height: 30.h,
                ),
                const DontHaveAccountText(),
                SizedBox(
                  height: 30.h,
                ),
                const LoginGoogleFacebook(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
