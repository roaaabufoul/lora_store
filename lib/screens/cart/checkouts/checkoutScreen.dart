import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/screens/cart/checkouts/steps/confirmation_step.dart';
import 'package:lora_store/screens/cart/checkouts/steps/payment_step.dart';
import 'package:lora_store/screens/cart/checkouts/steps/shipping_step.dart';
import '../../../widgets/components/LAppBar.dart';
import '../cart_screen.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  final ScrollController _scrollController = ScrollController();

  // step control
   int _currentStep = 0;
   void _goNextStep() {
      setState(() => _currentStep++);
      _scrollController.jumpTo(0);
   }
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: LAppbar.SecondAppBar(
             Padding(
               padding: const EdgeInsets.only(left: 65, top: 10).w,
               child: Text('Checkout', style: TextStyle(fontSize: 22.sp)),
             ),
             [],onPressed: (){
           setState(() {
             if(_currentStep>0){
               setState(() {
                 _currentStep --;
               });
             } else{
               Get.back();
             }
           });
         }
         ),
         body: Padding(
           padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
           child: SingleChildScrollView(
             controller: _scrollController,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     _buildStep(
                       icon: Iconsax.location5,
                       isActive: _currentStep ==0,
                       isCompleted: _currentStep >0,
                     ),
                     _buildDottedLine(isActive: false),
                     _buildStep(
                       icon: Iconsax.card5,
                       isActive: _currentStep ==1,
                       isCompleted: _currentStep >1,
                     ),
                     _buildDottedLine(isActive: false),
                     _buildStep(
                       icon: Icons.check_circle,
                       isActive: _currentStep ==2,
                       isCompleted: false,
                     ),
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 15, top: 20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'STEP ${_currentStep+1}',
                         style: TextStyle(
                           color: Colors.black54,
                           fontSize: 16.sp,
                         ),
                       ),
                       Text(_currentStep == 0? 'Shipping'
                           : (_currentStep == 1 ? 'Payment' : 'Confirmation')  ,
                         style: TextStyle(
                           fontSize: 24.sp,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ],
                   ),
                 ),
                 IndexedStack(
                   index: _currentStep,
                   children: [
                     ShippingStep(
                       onNext: _goNextStep,
                     ),
                     PaymentStep(onNext: _goNextStep,),
                     ConfirmationStep(),
                   ],
                 ),
               ],
             ),
           ),
         ),
       );
     }



     Widget _buildStep({
       required bool isActive,
       required bool isCompleted,
       required IconData icon,
     }) { return Container(
       margin: EdgeInsets.only(right: 10, left: 10),
       child: Icon(
         icon,
         size: 28.sp,
         color: isActive || isCompleted ? Colors.black : Colors.grey[300],
       ),
     );}

     Widget _buildDottedLine({required bool isActive}) {
       return Container(
         height: 3,
         width: 90,
         margin: const EdgeInsets.symmetric(horizontal: 0),
         child: Row(
           children: List.generate(
             5,
                 (i) => Expanded(
               child: Container(
                 decoration: BoxDecoration(
                   color: isActive  ? Colors.black : Colors.grey.shade300,
                   shape: BoxShape.circle,
                 ),
               ),
             ),
           ),
         ),
       );
     }
   }


