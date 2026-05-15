import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/components/LAppBar.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppbar.SecondAppBar(
        Padding(
        padding: const EdgeInsets.only(left: 65,top: 10).w,
        child: Text('Check out',
          style: TextStyle(
            fontSize: 22.sp,
          ),),
      ), []),
    );
  }
}
