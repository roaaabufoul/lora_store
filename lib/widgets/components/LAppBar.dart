import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/app.dart';

import '../../utils/constants/colors.dart';

class LAppbar {
  LAppbar._();

  static AppBar LAppBar(String title) => AppBar(

    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    leading: Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 10
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Iconsax.menu_1, size: 34),
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.fromLTRB(80, 60, 20, 50),
      child: Text(title),
    ),
    titleTextStyle: Theme.of(Get.context!).textTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Iconsax.notification, size: 28, color: Colors.black),
        ),
      ),
    ],
  );
  
  static AppBar SecondAppBar(String? title){
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(title ??''),
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500
      ),
      toolbarHeight: 90,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 75,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(30,4, 2, 0),
        child: Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius:3,
                    spreadRadius: 0,
                    color: LColors.grey,
                    offset: Offset(0, 2)
                )
              ]
          ),
          child: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(CupertinoIcons.back,size: 24,)),
        ),
      ),
    );
  }
}