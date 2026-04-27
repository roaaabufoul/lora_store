
import 'package:flutter/material.dart';
import 'package:lora_store/utils/theme/bottom_sheet_theme.dart';
import 'package:lora_store/utils/theme/text_theme.dart';

import '../constants/colors.dart';


class LAppTheme{
  LAppTheme._();

  static ThemeData LightTheme = ThemeData(
    useMaterial3: true,
    focusColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    fontFamily: 'Quicksand',
    brightness: Brightness.light,
    primaryColor: LColors.primaryGrey,
    scaffoldBackgroundColor: Colors.white,
    textTheme: LTextTheme.lightTextTheme,
    bottomSheetTheme: LBottomSheetTheme.lightBottomSheetTheme,
    // inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,


  );
  static ThemeData DarkTheme = ThemeData(
    focusColor: Colors.transparent,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: LColors.darkBackground,
      scrolledUnderElevation: 0,
    ),
    fontFamily: 'Quicksand',
    brightness: Brightness.dark,
    primaryColor: LColors.textWhite,
    scaffoldBackgroundColor: Colors.black,
    textTheme: LTextTheme.darkTextTheme,
    bottomSheetTheme: LBottomSheetTheme.darkBottomSheetTheme,



  );
}