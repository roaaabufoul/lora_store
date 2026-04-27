import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/screens/categories/show_items_screen.dart';
import 'package:lora_store/screens/search/filter_content.dart';
import 'package:lora_store/screens/search/search_screen.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/utils/constants/sizes.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'CLOTHING',
      'color': Color(0xFFA3A798),
      'image': 'assets/images/discover_collection.png',
      'sub': [
        {'title': 'Jacket', 'count': '128 Items'},
        {'title': 'Skirts', 'count': '40 Items'},
        {
          'title': 'Dresses',
          'count': '36 Items',
          'sub': [
            {'title': 'Sweaters', 'count': '24 Items'},
            {'title': 'Jeans', 'count': '14 Items'},
          ],
        },
      ],
    },
    {
      'title': 'ACCESSORIES',
      'color': Color(0xFF898280),
      'image': 'assets/images/accessories.png',
      'sub': [
        {'title': 'Bags', 'count': '20 Items'},
        {'title': 'Watches', 'count': '10 Items'},
      ],
    },
    {
      'title': 'SHOES',
      'color': Color(0xFF44565C),
      'image': 'assets/images/shoes2.png',
    },
    {
      'title': 'COLLECTION',
      'color': Color(0xFFB9AEB2),
      'image': 'assets/images/cloth2.png',
    },
  ];
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: LAppbar.LAppBar('Discover'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Row(
                spacing: 15,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: LColors.lightGrey,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 3,
                          color: LColors.secondaryGrey,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    width: 270,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        onTap: (){
                          Get.to(SearchScreen());
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.search_normal,
                            color: LColors.darkGrey,
                          ),
                          hint: Text(
                            'Search',
                            style: TextStyle(
                              color: LColors.darkGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60.w,
                    height: 58.h,
                    decoration: BoxDecoration(
                      color: LColors.lightGrey,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 3,
                          color: LColors.secondaryGrey,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        LWidgets.showFilterSheet(context);
                      },
                      icon: Icon(Iconsax.filter, color: LColors.darkGrey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: LSizes.defaultSpace * 0.7),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isOpen = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 350.w,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: categories[index]['color'],
                            borderRadius: BorderRadius.circular(17),
                            boxShadow: [
                              BoxShadow(
                                color: LColors.secondaryGrey,
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: LColors.secondaryGrey,
                                offset: Offset(-1, -1),
                                blurRadius: 3,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25, 15, 15, 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      categories[index]['title'],
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: 140.w,
                                      height: 140.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                              0.3,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 200,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                  child: Image.asset(
                                    categories[index]['image'],
                                    height: 170.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isOpen && categories[index].containsKey('sub'))
                          Column(
                            children: List.generate(
                              categories[index]['sub'].length,
                              (subIndex) {
                                final subItem =
                                    categories[index]['sub'][subIndex];

                                return GestureDetector(
                                  onTap: ()=> Get.to(ShowItemsScreen()),
                                  child: buildItem(
                                    subItem['title'],
                                    subItem['count'],
                                    sub: subItem['sub'],
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(String title, String count, {List? sub}) {
    return Column(
      children: [
        SizedBox(
          width: 400.w,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              title: Text(title),
              trailing: Container(
                width: 150.w,
                child: Row(
                  spacing: 0,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(count),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        Divider(height: 5.h, thickness: 1, color: LColors.secondaryGrey),
        if (sub != null)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: sub.map<Widget>((e) {
                return Column(
                  children: [
                    SizedBox(
                      width: 400.w,
                      child: ListTile(
                        title: Text(e['title']),
                        trailing: Container(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(e['count']),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_right),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 5.h,
                      thickness: 1,
                      color: LColors.secondaryGrey,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}