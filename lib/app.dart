import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lora_store/screens/categories/item_details.dart';
import 'package:lora_store/screens/on_boarding/welcome_screen.dart';
import 'package:lora_store/utils/theme/theme.dart';
import 'package:lora_store/widgets/components/navigation_menu.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 917),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
         debugShowCheckedModeBanner: false,
        theme: LAppTheme.LightTheme,
        darkTheme: LAppTheme.DarkTheme,
        home: NavigationMenu(),
      ),
    );
  }
}
