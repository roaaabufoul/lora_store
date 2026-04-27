import 'package:flutter/material.dart';
import 'package:lora_store/utils/constants/colors.dart';

class LTextTheme{
 LTextTheme._();

  static TextTheme lightTextTheme = TextTheme(

      headlineLarge:  const TextStyle().copyWith(fontSize: 64,fontWeight: FontWeight.w400, color: LColors.black, fontFamily: 'Quicksand'),
      headlineMedium: const TextStyle().copyWith(color: LColors.black,fontSize: 24,fontWeight: FontWeight.bold,fontFamily: 'Quicksand'),
      headlineSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: LColors.black ,fontFamily: 'Quicksand'),

      titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: LColors.black,fontFamily: 'Quicksand'),
      titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
      titleSmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),

      bodyLarge: const TextStyle().copyWith(fontSize: 15,fontWeight: FontWeight.w400,color:LColors.primaryGrey),
      bodyMedium: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black ),
      bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.5)),

      labelLarge: const TextStyle().copyWith(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),
      labelMedium:  const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black.withOpacity(0.5)),
      labelSmall:  const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black)

  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 64,fontWeight: FontWeight.w400, color: LColors.white),
    headlineMedium: const TextStyle().copyWith(color: LColors.textWhite,fontSize: 24,fontWeight: FontWeight.w600),
    headlineSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.normal,color: LColors.textWhite ),

    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: LColors.textWhite,letterSpacing: 2,),
    titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),
    titleSmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),

    bodyLarge: const TextStyle().copyWith(fontSize: 15,fontWeight: FontWeight.w400,color:LColors.textWhite),
    bodyMedium: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white ),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),
    labelMedium:  const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.5)),

  );

}