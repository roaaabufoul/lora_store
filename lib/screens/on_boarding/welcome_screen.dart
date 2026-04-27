import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lora_store/screens/on_boarding/onBoarding_screen.dart';
import 'package:lora_store/utils/constants/sizes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.png'),
            fit: BoxFit.cover
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.6),
            ),
            Positioned(
              bottom: 130,
              right: 45,
              child: Column(
                children: [
                  Text('Welcome to LoraStore!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white

                        ),
                  ),
                  SizedBox(height: LSizes.spaceBtwItems,),
                  Text('The home for a fashonista',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white

                    ),
                  ),
                  SizedBox(height: LSizes.defaultSpace*2,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.9),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 65),
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        )
                      ),
                      onPressed: (){
                        Get.to(OnboardingScreen());
                      },
                      child: Text('Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
