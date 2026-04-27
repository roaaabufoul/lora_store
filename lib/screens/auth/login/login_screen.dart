import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lora_store/screens/auth/login/forgot_password_screen.dart';
import 'package:lora_store/screens/auth/signup/sign_up_screen.dart';
import 'package:lora_store/screens/navigation_items/home_screen.dart';
import 'package:lora_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/validators/validation.dart';
import '../../../widgets/divider_social_login.dart';
import '../../../widgets/login_text_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
                  'Log into \nyour account ',
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

                    ],
                  ),
                ),
              ),
              SizedBox(height: LSizes.spaceBtwSections*1.7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                        onPressed: ()=> Get.to(ForgotPasswordScreen()),
                        child: Text('Forgot Password? ',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 14,
                          ),
                        )),
                ],
              ),
              SizedBox(height: LSizes.spaceBtwSections*0.8,),

              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: dark ? LColors.lightGrey :LColors.darkerGrey,
                        padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 50.w)
                    ),
                    onPressed: ()=> Get.to(HomeScreen()),
                    child: Text('LOG IN',
                      style: TextStyle(
                          color: dark ? LColors.primaryGrey:Colors.white,
                          fontWeight: FontWeight.bold
                      ),)),
              ),
              SizedBox(height: LSizes.spaceBtwSections*1.5),
              Center(
                child: DividerSocialLogin(
                    dividerText: 'Or login with',
                    onGooglePressed: (){}),
              ),
              SizedBox(height: LSizes.spaceBtwSections*0.8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  TextButton(
                      onPressed: ()=>Get.to(SignUpScreen()),
                      child: Text('Sign Up',
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
