import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lora_store/screens/auth/login/login_screen.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/utils/constants/sizes.dart';
import 'package:lora_store/utils/helpers/helper_functions.dart';
import 'package:lora_store/utils/validators/validation.dart';
import 'package:lora_store/widgets/divider_social_login.dart';
import 'package:lora_store/widgets/login_text_fields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordConfirm = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Create \nyour account ',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: LSizes.spaceBtwItems*2),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      LoginTextFields(
                        controller: nameController,
                        hintText: 'Enter your name',
                        icon: CupertinoIcons.person,
                        validator: (value) => LValidator.validateFullName(value),
                      ),
                      SizedBox(height: LSizes.spaceBtwItems*2,),
                      LoginTextFields(
                        controller: emailController,
                        hintText: 'Enter your email',
                        icon: CupertinoIcons.mail,
                        validator: (value) => LValidator.validateEmail(value),
                      ),
                      SizedBox(height: LSizes.spaceBtwItems*2,),
                      LoginTextFields(
                        controller: emailController,
                        hintText: 'Password',
                        icon: CupertinoIcons.padlock,
                        validator: (value) => LValidator.validatePassword(value),
                      ),
                      SizedBox(height: LSizes.spaceBtwItems*2,),
                      LoginTextFields(
                        controller: emailController,
                        hintText: 'Confirm Password',
                        icon: CupertinoIcons.padlock,
                        validator: (value) => LValidator.validatePassword(value),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: LSizes.spaceBtwSections*1.7,),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dark ? LColors.lightGrey :LColors.darkerGrey,
                      padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 50.w)
                    ),
                    onPressed: (){},
                    child: Text('SIGN UP',
                    style: TextStyle(
                      color: dark? LColors.primaryGrey : Colors.white,
                      fontWeight: FontWeight.bold
                    ),)),
              ),
              SizedBox(height: LSizes.spaceBtwSections*1.5),
              Center(
                child: DividerSocialLogin(
                    dividerText: 'Or sign up with',
                    onGooglePressed: (){}),
              ),
              SizedBox(height: LSizes.spaceBtwSections*0.8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    TextButton(
                        onPressed: () =>Get.to(LoginScreen()),
                        child: Text('Login',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: 18,

                          ),
                        ))
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
