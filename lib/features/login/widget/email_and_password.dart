import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_recipe_app/core/routing/routers_name.dart';
import 'package:my_recipe_app/features/login/widget/custom_buttom.dart';
import 'package:my_recipe_app/features/login/widget/custom_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty || value != 'abdo@abdo.com') {
                return 'enter email vaild';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty || value != '12345') {
                return 'enter password vaild';
              }
              return null;
            },
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                )),
          ),
          SizedBox(
            height: 75.h,
          ),
          CustomButtom(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pushReplacementNamed(context, RoutersName.homeSreen);
              }
            },
          ),
        ],
      ),
    );
  }
}
