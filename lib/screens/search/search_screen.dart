import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';

import 'filter_content.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final List<String> recentSearch=['Dresses' , 'Accessories' ,'Dresses',
    'Roaa khaled','Accessories','Dresses'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppbar.SecondAppBar(''),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 8, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Searches',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(CupertinoIcons.delete,color: Colors.grey , ))
                    ],
                  ),
                ),
              if(recentSearch.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(right: 9),
                  child: Wrap(
                    spacing:5,
                    children: recentSearch.map((item) {
                      return Chip(
                        side: BorderSide.none,
                        deleteIcon: Icon(CupertinoIcons.xmark,
                        color: LColors.grey,),
                        color:MaterialStateProperty.all(Colors.grey[100]),
                        label: Text(item,),
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                        onDeleted: () {
                          recentSearch.remove(item); }, ); }).toList(), ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 5,bottom: 7,right: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ,
                  children: [
                    Text('Popular this week',
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
                  itemCount: 3,
                  itemBuilder: (context , index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin : EdgeInsets.fromLTRB(0, 0, 20, 13),
                          width:160.w,
                          height: 220.h,
                          decoration: BoxDecoration(
                              color: LColors.secondaryGrey,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset('assets/images/featured.png',
                              fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Column(
                            spacing: 3,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tunic white shirt',
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),),
                              Text('\$ 39.99',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),),
                            ],
                          ),
                        )
                      ],

                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}




