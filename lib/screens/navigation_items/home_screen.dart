import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/components/LAppBar.dart';
import '../../widgets/items_listView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'Women', 'icon': Icons.female_outlined},
      {'title': 'Men', 'icon': Icons.male_outlined},
      {'title': 'Accessories', 'icon': Icons.watch_outlined},
      {'title': 'Beauty', 'icon': Iconsax.brush},
    ];
    return Scaffold(
      appBar: LAppbar.LAppBar('LoraStore'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
              child: Column(
                children: [
                  Container(
                    width: 400.w,
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 38, 0),
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: isSelected ? Border.all() : null,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected
                                            ? LColors.primaryGrey
                                            : Colors.grey[300],
                                      ),
                                      child: Icon(
                                        categories[index]['icon'],
                                        color: Colors.white,
                                        size: 36,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text(
                                    categories[index]['title'],
                                    style: TextStyle(
                                      color: isSelected
                                          ? LColors.primaryGrey
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // collections
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15,right: 26),
                        width: 350.w,
                        height: 210.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: LColors.secondaryGrey,
                        ),
                        child: PageView(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/collection.png',
                                fit: BoxFit.cover,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right:150,
                        child: SmoothPageIndicator(
                            controller: PageController(),
                            count: 3,
                        ),
                      ),
                      Positioned(
                        right: 35,
                          top: 40,
                          child: Text(
                            'Autumn\nCollection\n2021',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Colors.white
                            ),
                          ))
                    ],
                  ),
                  // Featured Section
                  Padding(
                    padding: const EdgeInsets.only(top: 22,left: 5,bottom: 7,right: 6),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween
                      ,
                      children: [
                        Text('Featured Products',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 20.sp
                        ),),
                        TextButton(
                            onPressed:(){},
                            child:  Text('Show all',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey
                              ),))
                      ],
                    ),
                  ),
                  Container(
                    height: 300.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                        itemBuilder: (context , index){
                        return ItemsListView();
                        },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 190.h,
              color: Colors.grey[100],
              child: Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('| NEW COLLECTION',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            ),),
                            Text('HANG OUT\n& PARTY',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                              color: LColors.primaryGrey
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        width: 165.w,
                        height: 165.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300]
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom:0,
                    right: 30.w,
                      child: Image.asset('assets/images/s4.png',
                        height: 185.h,
                        fit: BoxFit.contain,
                      ))
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 15,left: 5,bottom: 7,right: 6),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween
                     ,
                     children: [
                       Text('Recommended',
                         style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                             fontSize: 20.sp
                         ),),
                       TextButton(
                           onPressed:(){},
                           child:  Text('Show all',
                             style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                 color: Colors.grey
                             ),))
                     ],
                   ),
                 ),
                  Container(
                    width: double.infinity,
                    height: 70.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                        itemBuilder: (context, index){
                        return Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 80.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                  color: LColors.softGrey ),
                              right:  BorderSide(
                                  width: 1,
                                  color: LColors.softGrey   ),
                              bottom:  BorderSide(
                                  width: 1,
                                  color: LColors.softGrey                              ),
                            )
                          ),
                          child: Row(
                            children: [
                              Container(
                                width:70.w,
                                height: 80.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Image.asset('assets/images/ob.png',
                                width: 50.w,
                                    height: 50.h,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9),
                                child: Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('White fashion hoodie',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),),
                                    Text('\$ 29.00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                        }) ,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 5,bottom: 10,right: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Collection',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: 20.sp
                          ),),
                        TextButton(
                            onPressed:(){},
                            child:  Text('Show all',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey
                              ),))
                      ],
                    ),
                  ),
                   Container(
                     margin: EdgeInsets.only(right: 23),
                     width: 350.w,
                     height: 180.h,
                     decoration: BoxDecoration(
                       color: Colors.grey[100],
                       borderRadius: BorderRadius.circular(12)
                     ),
                     child:Stack(
                       children: [
                         Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.fromLTRB(30, 30, 35, 30),
                               child: Column(
                                 spacing: 10,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('| Sale up to 40%',
                                     style: TextStyle(
                                         fontSize: 16,
                                         color: Colors.grey
                                     ),),
                                   Text('FOR SLIM\n& BEAUTY',
                                     style: TextStyle(
                                         fontSize: 26,
                                         fontWeight: FontWeight.w400,
                                         color: LColors.primaryGrey
                                     ),)
                                 ],
                               ),
                             ),
                             Container(
                               width: 120.w,
                               height: 120.h,
                               decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: Colors.grey[200]
                               ),
                             )
                           ],
                         ),
                         Positioned(
                             bottom:0,
                             right: 10.w,
                             child: Image.asset('assets/images/top_collection.png',
                               height: 175.h,
                               fit: BoxFit.contain,
                             ))
                       ],
                     ),
                   ),
                  Container(
                    margin: EdgeInsets.only(right: 23, top: 20, bottom: 20),
                    width: 350.w,
                    height: 230.h,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:Stack(
                      children: [
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30,0, 30),
                              child: Column(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('| Summer Collection 2021',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey
                                    ),),
                                  Text('Most gentle\n& fabulous\n design',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: LColors.primaryGrey
                                    ),)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only( right: 18),
                              width: 120.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200]
                              ),
                            )
                          ],
                        ),
                        Positioned(
                            bottom:0,
                            right: 5.w,
                            child: Image.asset('assets/images/collection2.png',
                              height: 240.h,
                              fit: BoxFit.contain,
                            ))
                      ],
                    ),
                  )

               ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Row(
                spacing: 15,
                children: [
                  Container(
                  //  margin: EdgeInsets.only(right: 10),
                    width: 170.w,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom:0,
                            right: 70.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('assets/images/office.png',
                                height:220.h,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 50, 10, 0),
                          child: Column(
                            spacing: 10,
                            children: [
                               Text('T-Shirts',
                               style: TextStyle(
                                 color: Colors.grey,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 16
                               ),),
                              Text('The Office Life',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20
                                ),

                              )
                            ],
                          ),
                        )
                      ],
                    ),

                  ),
              Container(
                width: 170.w,
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 85, 0),
                      child: Column(
                        spacing: 10,
                        children: [
                          Text('Dresses',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                            ),),
                          Text('Elegant Design',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20
                            ),

                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom:0,
                        left: 88.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset('assets/images/dresses.png',
                            height:220.h,
                            fit: BoxFit.cover,
                          ),
                        )),

                  ],
                ),)
                ],
              ),
            ),
            SizedBox(height: 200,)
          ],
        ),
      ),
    );
  }
}

