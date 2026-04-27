
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

class FilterContent extends StatefulWidget {
  const FilterContent({super.key});

  @override
  State<FilterContent> createState() => _FilterContentState();
}

class _FilterContentState extends State<FilterContent> {
  int selectedIndex = 0;
  String selectedCategory = "Dresses";
  final List<String> discountList =[
    '30% off' , '50% off' ,'40% off',
    '10% off','25% off'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Filter",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Iconsax.filter),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 15,
            color: LColors.grey,
          ),
          SizedBox(height: 20),

          // Price
          Text("Price",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
            ),),
          RangeSlider(
            values: RangeValues(0, 80),
            labels: RangeLabels('\$10', '\$80'),
            min: 0,
            max: 100,
            activeColor: Colors.black,
            onChanged: (value) {},
          ),

          SizedBox(height: 20),

          // Colors
          Text("Color",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              )),
          SizedBox(height: 10),

          Row(
            spacing: 5,
            children: [
              buildColor(Colors.orange),
              buildColor(Colors.red),
              buildColor(Colors.black),
              buildColor(Colors.grey),
              buildColor(Colors.brown),
              buildColor(Colors.pink),

            ],
          ),
          SizedBox(height: 30),
          Text("Star Rating",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              )),
          SizedBox(height: 10),
          Container(
            width: 300.w,
            height: 80.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index){
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = index;
                        // selectedIndex+1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 50.w,
                      height: 50.h,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: LColors.primaryGrey,
                            width: 2),
                        color: isSelected ? LColors.primaryGrey : Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star,
                            color: isSelected ? Colors.white: LColors.primaryGrey,
                            size: 20,
                          ),
                          Text((index+1).toString(),
                              style: TextStyle(
                                  color: isSelected ? Colors.white: LColors.primaryGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(height: 30.h,),
          Text("Category",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              )),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                icon: Icon(Icons.keyboard_arrow_down),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  border: InputBorder.none,
                ),
                items: [
                  DropdownMenuItem(
                    value: "Dresses",
                    child: Row(
                      children: [
                        Icon(Icons.local_mall_outlined, size: 18),
                        SizedBox(width: 10),
                        Text("Dresses"),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Accessories",
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 18),
                        SizedBox(width: 10),
                        Text("Accessories"),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  selectedCategory = value!;
                },
              ),
            ),
          ),
          SizedBox(height: 30.h,),
          Text("Discount",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              )),
          SizedBox(height: 10.h,),
          if(discountList.isNotEmpty)
            Container(
              margin: EdgeInsets.only(right: 9,bottom: 30),
              child: Wrap(
                spacing:15,
                runSpacing: 10,
                children: discountList.map((item) {
                  return Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    side: BorderSide(
                        color: LColors.primaryGrey,
                        width: 2
                    ),
                    deleteIcon: Icon(
                      CupertinoIcons.xmark,
                      color: LColors.primaryGrey,fontWeight: FontWeight.bold,),
                    color:MaterialStateProperty.all(Colors.transparent),
                    label: Text(item,),
                    labelStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: LColors.primaryGrey,
                    ),
                    onDeleted: () {
                      discountList.remove(item); }, ); }).toList(), ),
            ),

          // 🔘 Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Reset",
                  style: TextStyle(
                      fontSize: 20,
                      color: LColors.black,
                      fontWeight: FontWeight.w500
                  ),),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: LColors.primaryGrey,
                    padding: EdgeInsets.symmetric(vertical: 10,
                        horizontal: 50)
                ),
                onPressed: () {},
                child: Text("Apply"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildColor(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }


}
class LWidgets {
  LWidgets._();
  static void showFilterSheet(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      barrierColor: Colors.black54,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30),
                ),
              ),
              child: FilterContent(), // 👇 محتوى الفلتر
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: Offset(1, 0), // من اليمين
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
