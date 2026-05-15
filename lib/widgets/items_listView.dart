
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/colors.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              Text('Turtleneck Sweater',
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
  }
}

