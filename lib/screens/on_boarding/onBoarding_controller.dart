import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lora_store/screens/auth/signup/sign_up_screen.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instance => Get.find();
   // variables
    final pageController = PageController();
    Rx<int> currentPageIndex = 0.obs;

    // void update current index when page scroll
     void updatePageIndicator(index)=> currentPageIndex.value = index;

     // jump to the specific dot selected
     void dotClick(index){
       currentPageIndex.value = index;
       pageController.jumpToPage(index);
     }
  // Update index and go to the next page
  void nextPage(){
    if(currentPageIndex.value ==2){
      Get.to(SignUpScreen());
    } else{
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }

  // update current index and go to the last page
  void skipPage(){

  }
}