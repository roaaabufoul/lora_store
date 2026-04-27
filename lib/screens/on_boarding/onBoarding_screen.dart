import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lora_store/screens/on_boarding/onBoarding_controller.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/device/device_utility.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
       body: Stack(
         children: [
           Container(
             margin: EdgeInsets.fromLTRB(0, 520, 0, 0),
             height: 400,
             color: LColors.primaryGrey,
           ),
           // skip button
           Positioned(
             top: LDeviceUtils.getAppBarHeight().h,
             right: LSizes.defaultSpace,
             child: TextButton(
                 onPressed: ()=> controller.skipPage(),
                 child: Text('Skip',
                   style: TextStyle(
                       color: LColors.primaryGrey
                   ),)),
           ),

            // page view -- onboarding content
           PageView(
             controller: controller.pageController ,
             onPageChanged: controller.updatePageIndicator,
             children: [
               onBoardingPage(
                 tittle: 'Discover something new',
                 subtittle: 'Special new arrivals just for you',
                 image: 'assets/images/ob.png',) ,
               onBoardingPage(
                 tittle: 'Update trendy outfit',
                 subtittle: 'Favorite brands and hottest trends',
                 image: 'assets/images/ob2.png',) ,
               onBoardingPage(
                 tittle: 'Explore your true style',
                 subtittle: 'Relax and let us bring the style to you',
                 image: 'assets/images/ob3.png',) ,
             ],
           ),

           // shop button
           Positioned(
             right: LSizes.defaultSpace*2.9,
             top: LDeviceUtils.getBottomNavigationBarHeight()*12.7.h,
             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.grey.withOpacity(0.9),
                     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 65),
                     side: BorderSide(
                       color: Colors.white,
                       width: 1,
                     )
                 ),
                 onPressed: ()=> controller.nextPage(),
                 child: Text('Shopping now',
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),)),
           ),
           // indicator
           Positioned(
             right: LSizes.defaultSpace*7,
             top: LDeviceUtils.getBottomNavigationBarHeight()*12.h,
             child: SmoothPageIndicator(
                 controller: controller.pageController,
                 onDotClicked: controller.dotClick,
                 effect: ExpandingDotsEffect(
                   activeDotColor: Colors.white,
                   dotWidth: 8,
                   dotHeight: 8,
                   dotColor: Colors.white,
                   paintStyle: PaintingStyle.stroke,
                 ),
                 count: 3),
           ),

         ]
       ),
    );
  }
}

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key,
    required this.tittle,
    required this.subtittle,
    required this.image
  });
 final String image , tittle , subtittle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 130,),
          Text(tittle,
          style:  TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: LSizes.spaceBtwItems,),
          Text(subtittle,
            style:  TextStyle(
                fontSize: 14,
            ),),
          SizedBox(height: LSizes.defaultSpace,),
          Container(
             decoration: BoxDecoration(
               color: LColors.secondaryGrey,
               borderRadius: BorderRadius.circular(12)
             ),
             width: 265.w ,
             height: 380.h,
            child:Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Image.asset(
                image,
                width: 300,
                height: 400,
                                ),
            ), ),
        ],
      ),

    );
  }
}
