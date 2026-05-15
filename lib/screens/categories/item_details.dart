import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/screens/cart/cart_screen.dart';
import 'package:lora_store/screens/categories/show_items_screen.dart';
import 'package:lora_store/utils/constants/sizes.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/colors.dart';
import '../../widgets/items_listView.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

int selectedColor = 0;
int selectedSize = 0;

bool descriptionOpened = false;
bool reviewsOpened = false;
bool similarOpened = false;
final List<Color> colors = [Color(0xFFD2A679), Colors.black, Colors.red];
final List<String> sizes = ['S', 'M', 'L'];
final ratings = [
  {'star' : 5, 'percent' : 0.8},
  {'star' : 4, 'percent' : 0.10},
  {'star' : 3, 'percent' : 0.3},
  {'star' : 2, 'percent' : 0.5},
  {'star' : 1, 'percent' : 0.2}
];
//for Pic views
final pageController = PageController();
Rx<int> currentIndex = 0.obs;

// Update current index when photos scrolled
void updatePageIndicator(index) => currentIndex.value = index;
// jump to the specific dot selected
void dotClicked(index){
  currentIndex.value = index;
  pageController.jumpToPage(index);
}
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
                // photos page view
                Positioned(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 50.h, 0, 0),
                    width: double.infinity,
                    height: 500.h,
                    child: PageView(
                      controller: pageController,
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
                // page indicator
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 395.h),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      onDotClicked: dotClicked,
                      effect: WormEffect(
                        dotHeight: 15,
                        strokeWidth: 3,
                        spacing: 12,
                        dotWidth: 15,
                        paintStyle: PaintingStyle.stroke,
                      ),
                    ),
                  ),
                ),
                // back
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
                // fav icon
                Positioned(
                  right: 25.w,
                  top: 50.h,
                  child: FavoriteIcon(iconColor: Colors.red),
                ),
                // Details
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
                                    StarsWidget(size: 24, reviewCount: 64,),
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
                              // Reviews and rating
                              Column(
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
                                              fontSize: 38.sp,
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
                                  // rates percents
                                  Container(
                                    margin: EdgeInsets.only(top: LSizes.spaceBtwItems, bottom: LSizes.spaceBtwItems),
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: ratings.length,
                                        itemBuilder: (context, index){
                                          final rate = ratings[index];
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              children: [
                                                Text(rate['star'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.grey,
                                                  ),),
                                                Icon(
                                                  Iconsax.star1,
                                                  size: 26.sp,
                                                  color: Color(0xFF508A7B),
                                                ),
                                                SizedBox(width: 15,),
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: LinearProgressIndicator(
                                                      value: rate['percent']!.toDouble(),
                                                      minHeight: 6,
                                                      backgroundColor: Colors.grey.shade300,
                                                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF508A7B),),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 15,),
                                                Text('${(rate['percent']!*100).toInt()}%',
                                                  style: TextStyle(
                                                      fontSize: 16
                                                  ),)

                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('47 Reviews',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16
                                      ),),
                                      Row(
                                        children: [
                                          Text('WRITE A REVIEW',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16
                                            ),),
                                          Icon(Icons.edit , color: Colors.grey,)
                                        ],
                                      )
                                    ],
                                  ),
                                   SizedBox(height: LSizes.spaceBtwItems,),
                                   // reviews comments
                                   Container(
                                     child: ListView.builder(
                                       padding: EdgeInsets.zero,
                                       physics: NeverScrollableScrollPhysics(),
                                       shrinkWrap: true,
                                       itemCount: 2,
                                         itemBuilder: (context , index){
                                         return  Column(
                                           children: [
                                             ListTile(
                                               contentPadding: EdgeInsets.zero,
                                               leading: CircleAvatar(
                                                 backgroundColor: Colors.grey[300],
                                                 radius: 30,
                                                 child: Icon(Icons.person, color: Colors.grey,),
                                               ),
                                               title: Text('Roaa Khaled',
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 16.sp
                                                 ),),
                                               subtitle: StarsWidget(size: 14,),
                                               trailing: Text('5m ago',
                                                 style: TextStyle(
                                                     color: Colors.grey,
                                                     fontSize: 16,
                                                     fontWeight: FontWeight.w400
                                                 ),),
                                             ),
                                             Container(
                                               margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                               child: Text('I love it. '
                                                   'Awesome customer service!!'
                                                   'Helped me out with adding an additional item to my order.'
                                                   'Thanks again!' ,
                                                 style: TextStyle(
                                                     fontSize: 13
                                                 ),),
                                             ),
                                           ],
                                         );
                                         }),
                                   ),
                                  // Similar product
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        similarOpened = !similarOpened;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Similar Product',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(similarOpened? CupertinoIcons.chevron_down: CupertinoIcons.chevron_right, size: 20),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey[200],
                                    height: LSizes.spaceBtwSections * 1.2,
                                    indent: 5,
                                  ),
                                  // similar list
                                  if(similarOpened)
                                    Container(
                                      width: double.infinity,
                                      height: 300,
                                      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index){
                                            return ItemsListView();
                                          }),
                                    ),
                                  SizedBox(height: LSizes.spaceBtwSections,)
                                        ],
                                      ),
                               //   SizedBox(height: 100),

                                ],
                              ),

                      ),

                      // add to cart button
                      GestureDetector(
                        onTap: ()=>Get.to(()=> CartScreen()),
                        child: Container(
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
