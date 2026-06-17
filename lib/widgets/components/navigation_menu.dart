import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/screens/navigation_items/discover_screen.dart';
import 'package:lora_store/screens/navigation_items/my_orders_screen.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';
import '../../screens/navigation_items/home_screen.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helpers/helper_functions.dart';



class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
   final dark = LHelperFunctions.isDarkMode(context);
    return Scaffold(
    // appBar:LAppbar.LAppBar(controller.selectedIndex == 0 ? 'LoraStore' :
     // drawer: DrawerNav(),
      body: Stack(
          children: [
            Obx(() => controller.screens[controller.selectedIndex.value]),
            Positioned(
              top:830 ,
              left:0 ,
              right: 0,
              child: Obx(
                    () => Container(
                  width: double.infinity,
                  height: 90.h,
                   decoration: BoxDecoration(
                    color: Colors.white,
                    border:Border(
                      top: BorderSide(
                        color: LColors.secondaryGrey
                      )
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)
                    ),
                   boxShadow: [
                      BoxShadow(
                          color:  LColors.secondaryGrey,
                          blurRadius:10, spreadRadius: 0),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(
                          icon: Iconsax.home,
                          index: 0,
                          controller: controller,
                        ),
                        _buildNavItem(
                          icon: Iconsax.search_normal,
                          index: 1,
                          controller: controller,
                        ),
                        _buildNavItem(
                          icon: Iconsax.shopping_cart,
                          index: 2,
                          controller: controller,
                        ),
                        _buildNavItem(
                          icon: Iconsax.user,
                          index: 3,
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ]
      ) ,

    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required NavigationController controller,
  }) {
    bool isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index;

      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? LColors.black : LColors.grey,
            size: 26.sp,
          ),
          SizedBox(height: 3.h,),
          Container(
            width: 20.w,
            height: 1.h,
            decoration: BoxDecoration(
              color: isSelected ? LColors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(1.r),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [HomeScreen(), DiscoverScreen(), MyOrdersScreen(), Container()];

  void changePage(int index) {
    selectedIndex.value = index;
  }

  void goToHome() {
    selectedIndex.value = 0;
  }

}
