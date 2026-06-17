import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lora_store/screens/cart/checkouts/checkoutScreen.dart';
import 'package:lora_store/utils/constants/colors.dart';
import 'package:lora_store/utils/constants/sizes.dart';
import 'package:lora_store/widgets/components/LAppBar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppbar.SecondAppBar(Padding(
        padding: const EdgeInsets.only(left: 65,top: 10).w,
        child: Text('Your Cart',
        style: TextStyle(
          fontSize: 22.sp,
        ),),
      ), [],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context , index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 25),
                      width: 310.w,
                      height: 115.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            color: LColors.secondaryGrey,
                            blurRadius: 6,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Container(
                            width : 105.w,
                            height: 120.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25)
                                ),
                                child: Image.asset('assets/images/ob.png',
                                fit: BoxFit.contain,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Row(
                              children: [
                                Column(
                                  spacing: 0,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                     spacing: 48,
                                      children: [
                                        Text('Sportwear Set',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        Transform.scale(
                                          scale: 1.5,
                                          child: Checkbox(
                                           shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(5)
                                           ),
                                             activeColor: LColors.green,
                                              value: true,
                                              onChanged: (value){}
                                          ),
                                        )
                                      ],
                                    ),
                                    Text('\$ 80.00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp
                                    ),),
                                    Flexible(
                                      child: Row(
                                        spacing: 25,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Size: L | Color: Cream",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.grey
                                              ),),
                                            ],
                                          ),
                                          Container(
                                            width: 70.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.grey
                                              )
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 7),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                spacing: 12,
                                                children: [
                                                  Icon(Icons.remove,size: 14,color: Colors.grey,),
                                                  Text('1',
                                                  style: TextStyle(
                                                  color: Colors.grey
                                                  ),),
                                                  Icon(Icons.add,size: 14,color: Colors.grey)
                                                ],
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),

            ),
            shippingPriceWidget(buttonOnPressed: ()=> Get.to(()=>Checkoutscreen()),)
          ],
        ),
      ),
    );
  }
}

class shippingPriceWidget extends StatelessWidget {
   shippingPriceWidget({
    super.key, required this.buttonOnPressed,
     this.row
  }
  );
  Widget? row;
  final VoidCallback buttonOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.h, left: 30.w,right: 30.w,bottom:30),
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 10,
            spreadRadius: 2,
            color: LColors.secondaryGrey
          )
        ]
      ),
      child: Column(
        children: [
          // price
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('Product price',
             style: TextStyle(
               fontSize: 18.sp,
               color: Colors.grey,
               fontWeight: FontWeight.w500
             ),),
             Text('\$110',
               style: TextStyle(
                   fontSize: 18.sp,
                   color: Colors.black,
                   fontWeight: FontWeight.w500
               ),),

           ],
         ),
          Divider(
            thickness: 1,
            color: LColors.grey,
            height: 50,
          ),
          // shipping
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                ),),
              Text('Freeship',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                ),),
            ],
          ),
          Divider(
            thickness: 1,
            color: LColors.grey,
            height: 50,
          ),
          // subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                ),),
              Text('\$110',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),),
            ],
          ),
            if(row != null)
              row!,
          // proceed to checkout button
          ProcessButton(
            onPressed : buttonOnPressed,
            title: 'Proceed to checkout',
          ),
        //  SizedBox(height: 300,)
        ],
      ),
    );
  }
}

class ProcessButton extends StatelessWidget {
  const ProcessButton({
    super.key,
     required this.title, required this.onPressed
  });
   final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: LSizes.spaceBtwItems*1.5),
      width: 350.w,
      height: 65.h,
      child: ElevatedButton(
          onPressed:onPressed ,
          style: ElevatedButton.styleFrom(
          backgroundColor: LColors.primaryGrey
          ),
      child: Text(title,
      style: TextStyle(
         color: Colors.white,
        fontWeight: FontWeight.w700
      ),)),
    );
  }
}
