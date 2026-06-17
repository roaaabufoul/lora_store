import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/utils/enums/order_status.dart';

import '../../widgets/components/LAppBar.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 30),
        child: Column(
          children: [
            Container(
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
            )
          ],
        ),
      ) ,
    );
  }
}
