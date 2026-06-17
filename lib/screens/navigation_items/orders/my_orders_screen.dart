import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lora_store/screens/navigation_items/orders/order_details.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/utils/enums/order_status.dart';

import '../../../widgets/components/LAppBar.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override

  var status = [
    'On Way',
    'Delivered',
    'Cancelled'
  ];

  int statusSelected =0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppbar.LAppBar('My Orders'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 25, bottom: 7),
              width: double.infinity,
              height:40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_,index){
                    final orderStatus = status[index];
                  return InkWell(
                    onTap: (){
                      setState(() {
                        statusSelected = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      margin: EdgeInsets.only(left: 5),
                      decoration: statusSelected==index ?
                      BoxDecoration(
                          color: LColors.primaryGrey,
                          borderRadius: BorderRadius.circular(30)
                      ): null,
                      child: Text(orderStatus,
                      style: TextStyle(fontSize: 18,
                      color: statusSelected==index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),),
                    ),
                  );
              }),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 22, 12, 25),
              width: 370,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
               shrinkWrap: true,
               itemCount: 5,
               itemBuilder: (_, context){
                 return Container(
                   margin: EdgeInsets.only(bottom: 20),
                   height: 200.h,
                   decoration: BoxDecoration(
                     color:   Colors.white,
                     borderRadius: BorderRadius.circular(15),
                     boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 8),
                          blurRadius: 10,
                          spreadRadius: 2,
                          color: Colors.grey.shade200
                        )
                     ]
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(15),
                     child: Column(
                       spacing: 15,
                       children: [
                         // order number + time
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Order #1524',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20
                             ),),

                             Text('13/05/2025',
                             style: TextStyle(
                               color: Colors.grey,
                               fontWeight: FontWeight.bold,
                               fontSize: 16
                             ),)
                           ],
                         ),
                         // tracking number
                         Row(
                           spacing: 8,
                           children: [
                             Text('Tracking number:',
                               style: TextStyle(
                                   color: Colors.grey,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16
                               ),),
                             Text('IK2326263563',
                               style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16
                               ),),
                           ],
                         ),
                         // quantity + total
                         Row(
                           spacing: 8,
                           children: [
                             Text('Quantity:',
                               style: TextStyle(
                                   color: Colors.grey,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16
                               ),),
                             Text('2',
                               style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16
                               ),),
                             SizedBox(width: 100,),
                             Text('SubTotal:',
                               style: TextStyle(
                                   color: Colors.grey,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16
                               ),),
                             Text('\$150',
                               style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16
                               ),),
                           ],
                         ),
                         // status + details button
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('ON WAY',
                             style: TextStyle(
                               fontSize: 18.sp,
                               fontWeight: FontWeight.w800,
                               color: Colors.orange
                             ),),
                             ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
                                 backgroundColor: Colors.white,
                                 side: BorderSide(
                                   width: 1,
                                 )
                               ),
                                 onPressed: ()=> Get.to(OrderDetails()),
                                 child: Text('Details',
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.w500
                                 ),))
                           ],
                         )
                       ],
                     ),
                   ),
                 );
               }),
            ),
           SizedBox(height: 50,)
          ],
        ),
      ) ,
    );
  }
}
