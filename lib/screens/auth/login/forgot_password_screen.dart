import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/validators/validation.dart';
import '../../../widgets/login_text_fields.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    final emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: dark ? Colors.black:Colors.white,
                        shape: BoxShape.circle,
                        boxShadow:[
                          BoxShadow(
                         color:LColors.secondaryGrey,
                            offset: Offset(0, 0),
                            blurRadius: 8,
                            spreadRadius: 0
                          )
                        ]
                      ),
                      child: IconButton(
                          onPressed: ()=> Get.back(),
                          icon:Icon( CupertinoIcons.back)),
                    ),
                  ],
                ) ,
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: LSizes.spaceBtwItems),
                      Text(
                        'Enter email associated'
                            ' with your account\n and we’ll'
                            ' send and email with intructions'
                            ' to\n reset your password',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.normal,
                          fontSize: 16
                        ),
                      ) ,
                      SizedBox(height: LSizes.spaceBtwItems*3,),
                      LoginTextFields(
                        controller: emailController,
                        hintText: 'Enter your email',
                        icon: CupertinoIcons.mail,
                        validator: (value) => LValidator.validateEmail(value),
                      ),
                      SizedBox(height: LSizes.spaceBtwItems*2.5,),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: dark ? LColors.lightGrey: LColors.darkerGrey,
                                padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 50.w)
                            ),
                            onPressed: (){},
                            child: Text('SUBMIT',
                              style: TextStyle(
                                  color: dark ? Colors.black :   Colors.white ,
                                  fontWeight: FontWeight.bold
                              ),)),
                      )
                    ],
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
