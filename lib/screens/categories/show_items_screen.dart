import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';

import '../../utils/constants/colors.dart';

class ShowItemsScreen extends StatefulWidget {
  const ShowItemsScreen({super.key});

  @override
  State<ShowItemsScreen> createState() => _ShowItemsScreenState();
}

class _ShowItemsScreenState extends State<ShowItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppbar.SecondAppBar('Dresses'),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 18,
                      childAspectRatio: 0.5
                    ),
                    itemBuilder: (context, index){
                      return Container(
                        width: 150.w,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 180.w,
                                  height: 250.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[200]
                                  ),
                                  child: ClipRRect(
                                    borderRadius:BorderRadius.circular(15) ,
                                    child: Image.asset(
                                        'assets/images/image.png',
                                    fit: BoxFit.cover,),
                                  ),
                                ),
                                Positioned(
                                  right: 10.w,
                                  top: 10.h,
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 2),
                                          color: Colors.grey.shade500,
                                          blurRadius: 2,
                                          spreadRadius: 0
                                        )
                                      ]
                                    ),
                                    child: IconButton(
                                        onPressed: (){},
                                        icon: Icon(
                                          Icons.favorite,
                                          color: index == 0 || index ==2 ? Colors.red : Colors.grey[400],
                                          size: 26,
                                        )),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,15,0,0),
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Linen Dress',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),),
                                  Row(
                                    spacing: 7,
                                    children: [
                                      Text('\$ 52.00',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),),
                                      if(index ==0 || index ==1)
                                          Text('\$ 82.00',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: LColors.textSecondary,
                                          ),)
                                    ],
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                       Row(
                                         children: List.generate
                                           (5, (index){
                                             return Icon(index<4? CupertinoIcons.star_fill: Icons.star
                                             , color: Colors.green.shade200,size: 14,);
                                         }),
                                       ),
                                      Text('(64)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: LColors.textSecondary,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
