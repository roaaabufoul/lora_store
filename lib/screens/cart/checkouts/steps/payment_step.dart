import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../cart_screen.dart';

class PaymentStep extends StatefulWidget {
  const PaymentStep({super.key, required this.onNext});
   final VoidCallback onNext;
  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  int? selectedMethod;
  List<Map<String , dynamic>> methods = [
    {
      'icon' : Iconsax.money,
      'title' : 'Cash',
    },
    {
      'icon' : Iconsax.card,
      'title' : 'Credit Card',
    } ,
    {
      'icon' : Iconsax.more,
      'title' : '',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 25, 10, 15),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            width: double.infinity,
            height: 85,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: methods.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context , index){
                  final method = methods[index];
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedMethod = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.w,
                      bottom: 10,top: 10),
                      padding: EdgeInsets.only(top: 8),
                      height: 64.h,
                      width: 100,
                      decoration: BoxDecoration(
                          color: selectedMethod == index ?
                          LColors.primaryGrey :Colors.white ,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: selectedMethod != index ? [
                            BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                spreadRadius: 1,
                                color: LColors.secondaryGrey
                            )
                          ] :[]
                      ), child: Column(
                      children: [
                        Icon(method['icon'],
                          size: 30,color:selectedMethod == index ?Colors.white :LColors.darkGrey,),
                        Text(method['title'],
                          style: TextStyle(
                              color:selectedMethod == index ?Colors.white :LColors.darkGrey,
                              fontWeight: FontWeight.bold
                          ),)
                      ],
                    ),
                    ),
                  );
                }),
          ),
          if(selectedMethod==1)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose your card',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),),
                    TextButton(
                        onPressed: (){},
                        child: Text('Add new\+' ,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),))
                  ],
                ),
                Container(
                  width: double.infinity.w,
                  height: 250.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                       itemCount: 3,
                      itemBuilder: (_, index){
                        return Image.asset('assets/images/visa.png',
                        width: 380.w,
                          fit: BoxFit.contain,
                        );
                      }),
                )
              ],
            ),
          shippingPriceWidget(
            buttonOnPressed: widget.onNext,
            row: Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      side: BorderSide(
                          width: 0.8,
                          color: Colors.grey
                      ),
                      value: false,
                      activeColor: LColors.green,
                      onChanged: (value){}
                  ),
                  Text('I agree terms and conditions',
                  style: TextStyle(
                    fontSize: 16.sp
                  ),),
                  // proceed to checkout button
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
