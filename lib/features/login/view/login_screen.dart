import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/routing/routers_name.dart';
import 'package:my_recipe_app/core/theming/text_styel.dart';
import 'package:my_recipe_app/features/login/widget/custom_buttom.dart';
import 'package:my_recipe_app/features/login/widget/dont_have_account_text.dart';
import 'package:my_recipe_app/features/login/widget/email_and_password.dart';
import 'package:my_recipe_app/features/login/widget/login_google_facebook.dart';
import 'package:my_recipe_app/features/login/widget/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
                  'Welcome Back',
                  style: TextStyles.font25primaryBold,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'We are excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
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
                const SizedBox(
                  height: 30,
                ),
                const DontHaveAccountText(),
                const SizedBox(
                  height: 30,
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
