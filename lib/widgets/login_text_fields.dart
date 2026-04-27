import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lora_store/utils/helpers/helper_functions.dart';

import '../utils/constants/colors.dart';

class LoginTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;

  const LoginTextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: dark ? LColors.secondaryGrey : LColors.black, fontSize: 15.sp),
          prefixIcon: Icon(icon, color: dark ? LColors.secondaryGrey : LColors.black, size: 20,),
          suffixIcon: suffixIcon,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color:LColors.secondaryGrey
            )
          ),
          errorBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(color: dark ? LColors.white :Colors.black ),
          ),
       contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          errorStyle: TextStyle(
            color: LColors.error,
            fontSize: 12.sp,
            height: 1.5.h,
          ),
        ),
    );
  }
}