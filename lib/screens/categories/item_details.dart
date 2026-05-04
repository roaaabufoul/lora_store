import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/screens/categories/show_items_screen.dart';
import 'package:lora_store/utils/constants/sizes.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';

import '../../utils/constants/colors.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

int selectedColor = 0;

int selectedSize = 0;

bool descriptionOpened = false;
bool reviewsOpened = false;
final List<Color> colors = [Color(0xFFD2A679), Colors.black, Colors.red];
final List<String> sizes = ['S', 'M', 'L'];

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: LAppbar.SecondAppBar('', []),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(color: Color(0xFFFFFBF8)),
                  child: Padding(
                    padding: const EdgeInsets.all(70),
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFEACAB7).withOpacity(0.22),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 25, top: 50.h),
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 0,
                          color: LColors.grey,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(CupertinoIcons.back, size: 24),
                    ),
                  ),
                ),
                Positioned(
                  right: 25.w,
                  top: 50.h,
                  child: FavoriteIcon(iconColor: Colors.red),
                ),

                Positioned(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 50.h, 0, 0),
                    width: double.infinity,
                    height: 500.h,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          'assets/images/details.png',
                          fit: BoxFit.contain,
                        ),
                        Image.asset('assets/images/details.png'),
                        Image.asset('assets/images/details.png'),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 430),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: LColors.secondaryGrey,
                        blurRadius: 11,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 45, 30, 0),
                        child: Column(
                          // item details
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // item name + evaluation
                                Column(
                                  spacing: 15,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sportwear Set',
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    StarsWidget(size: 24),
                                  ],
                                ),
                                // item price $$
                                Text(
                                  '\$ 80.00',
                                  style: TextStyle(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[200],
                              height: LSizes.spaceBtwSections * 1.2,
                              indent: 5,
                            ),
                            // colors + sizes
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // color
                                Column(
                                  spacing: 12,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Color',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: LColors.darkGrey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(colors.length, (
                                        index,
                                      ) {
                                        bool isSelected =
                                            selectedColor == index;
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedColor = index;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: isSelected
                                                  ? Border.all(
                                                      color: Colors.white,
                                                      width: 5,
                                                    )
                                                  : null,
                                              boxShadow: isSelected
                                                  ? [
                                                      BoxShadow(
                                                        offset: Offset(0, 4),
                                                        color: LColors.grey,
                                                        blurRadius: 15,
                                                        spreadRadius: 2,
                                                      ),
                                                    ]
                                                  : null,
                                            ),
                                            child: CircleAvatar(
                                              radius: 12,
                                              backgroundColor: colors[index],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                // sizes
                                Column(
                                  spacing: 12,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Size',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: LColors.darkGrey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(sizes.length, (
                                        index,
                                      ) {
                                        bool isSelected = selectedSize == index;
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSize = index;
                                            });
                                          },
                                          child: Container(
                                            width: 40.w,
                                            height: 40.h,
                                            margin: EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSelected
                                                  ? LColors.primaryGrey
                                                  : LColors.thirdGrey,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    13,
                                                    8,
                                                    0,
                                                    0,
                                                  ),
                                              child: Text(
                                                sizes[index],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : LColors.darkGrey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[200],
                              height: LSizes.spaceBtwSections * 1.2,
                              indent: 5,
                            ),
                            // Description
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  descriptionOpened = !descriptionOpened;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(descriptionOpened ? CupertinoIcons.chevron_down: CupertinoIcons.chevron_right, size: 20),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[200],
                              height: LSizes.spaceBtwSections * 1.2,
                              indent: 5,
                            ),
                            if (descriptionOpened)
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(2, 0, 15, 25),
                                child: Text(
                                  'Sportswear is no longer under culture, '
                                  'it is no longer indie or cobbled together as it once was.'
                                  ' Sport is fashion today. '
                                  'The top is oversized in fit and style,'
                                  ' may need to size down.',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                            // Reviews
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  reviewsOpened = !reviewsOpened;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(reviewsOpened? CupertinoIcons.chevron_down: CupertinoIcons.chevron_right, size: 20),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[200],
                              height: LSizes.spaceBtwSections * 1.2,
                              indent: 5,
                            ),
                            if (reviewsOpened)
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 14,
                                          children: [
                                            Text(
                                              '4.9',
                                              style: TextStyle(
                                                fontSize: 36.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'OUT OF 5',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          spacing: 5,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: List.generate(5, (
                                                index,
                                              ) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    right: 2,
                                                  ),
                                                  child: Icon(
                                                    Iconsax.star1,
                                                    size: 26.sp,
                                                    color: Color(0xFF508A7B),
                                                  ),
                                                );
                                              }),
                                            ),
                                            Text(
                                              '83 ratings',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                     SizedBox(height: LSizes.defaultSpace,),
                                     Row(
                                       children: [
                                         Text('5',style: TextStyle(
                                           fontSize: 14.sp,
                                           color: Colors.grey,
                                         ),),
                                         Icon(
                                           Iconsax.star1,
                                           size: 26.sp,
                                           color: Color(0xFF508A7B),
                                         ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),

                                          child: LinearProgressIndicator(
                                            value: 80,
                                            minHeight: 6,
                                            backgroundColor: Colors.grey[300],
                                            valueColor: AlwaysStoppedAnimation(Colors.green),
                                          ),
                                        )
                                       ],
                                     ),
                                    SizedBox(height: 100),

                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      // add to cart button
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 22, 40, 25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: LColors.primaryGrey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 40,
                            ),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
