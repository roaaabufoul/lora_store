import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: LAppbar.SecondAppBar(Padding(
         padding: const EdgeInsets.only(left: 40),
         child: Text('Order #12326',
         style: TextStyle(
           fontSize: 22
         ),),
       ), []),

      body: Padding(
        padding:  EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 7),
             width: 370.w,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: LColors.primaryGrey.withOpacity(0.9)
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your order is delivered',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18
                      ),),
                      Text('Rate product to get 5 points for collect.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14
                        ),)
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
