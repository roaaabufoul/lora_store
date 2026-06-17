import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/validators/validation.dart';
import '../../cart_screen.dart';

class ShippingStep extends StatefulWidget {
  final VoidCallback onNext;
  const ShippingStep({super.key, required this.onNext});

  @override
  State<ShippingStep> createState() => _ShippingStepState();
}

class _ShippingStepState extends State<ShippingStep> {
  final _formKey = GlobalKey<FormState>();
  String _selectedMethod = '';
  bool   _copyToBilling  = false;

  void _submit() {
    // 1. Validate all form fields
    if (!(_formKey.currentState?.validate() ?? true)) return;

    // 2. Validate shipping method separately (it's not a TextFormField)
    if (_selectedMethod.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a shipping method'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    } }


  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 20, 0),
            child: Column(
              spacing: 20,
              children: [
                // First name
                buildTextFormField(
                  hint: 'Full name *',
                  validator: (value) => LValidator.validateFullName,
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: buildTextFormField(
                      hint: 'Country',
                      validator: (value) => LValidator.validateFullName,
                      readOnly: true,
                      icon: Icon(Icons.keyboard_arrow_down,)
                  ),
                ),
                buildTextFormField(
                  hint: 'Street name *',
                  validator: (value) => LValidator.validateEmptyText,
                ),
                buildTextFormField(
                  hint: 'City *',
                  validator: (value) => LValidator.validateEmptyText,
                ),
                buildTextFormField(
                  hint: 'State / Province',
                  validator: (value) => LValidator.validateEmptyText,
                ),
                buildTextFormField(
                  hint: 'Zip-code *',
                  validator: (value) => LValidator.validateEmptyText,
                ),
                buildTextFormField(
                  hint: 'Phone number *',
                  validator: (value) => LValidator.validateEmptyText,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping method',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                      indent: 8,
                      endIndent: 20,
                      height: 10,
                    ),
                  ),

                  buildDeliveryChoices(
                      cost: 'free',
                      deliveryWay: 'Delivery to home',
                      period: 'Delivery from 3 to 7 business days'),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade200,
                      indent: 8,
                      endIndent: 20,
                      height: 10,
                    ),
                  ),
                  buildDeliveryChoices(
                      cost: '\$ 9.90',
                      deliveryWay: 'Fast Delivery',
                      period: 'Delivery from 2 to 3 business days'),

                ],
              ),
              SizedBox(height: LSizes.spaceBtwSections,),
              Text(
                'Coupon Code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              // coupon field
              Container(
                padding: EdgeInsets.only(right: 5),
                margin: EdgeInsets.only(left: 5,top: 15, bottom: 22),
                width: 325.w,
                height: 55.h,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Have a code? type it here.. ',
                            hintStyle: TextStyle(
                                color: LColors.grey
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                            overlayColor:  WidgetStatePropertyAll(Colors.grey.shade200)
                        ),
                        onPressed: (){},
                        child: Text('Validate',
                          style: TextStyle(
                              color: LColors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),))
                  ],
                ),
              ),
              Text(
                ' Billing Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text('Copy address data from shipping'),
                  // proceed to checkout button
                ],
              ),
             Center(
               child: Container(
                   margin: EdgeInsets.only(bottom: 15,),
                   child: ProcessButton(title: 'Continue to payment', onPressed: widget.onNext)),
             )

            ],
          ),
        ),
      ],
    );
  }

  Row buildDeliveryChoices(
      {
        required String cost,
        required String deliveryWay,
        required String period,
      }
      ) {return Row(
    spacing: 10,
    children: [
      Transform.scale(
        scale: 1.5,
        child: Radio(
          innerRadius: WidgetStatePropertyAll(3),
          value: cost,
          groupValue: _selectedMethod,
          onChanged: (value) {
            setState(() {
              _selectedMethod = value!;
            });
          },
          activeColor: LColors.green,
          side: BorderSide(width: 0.8, color: Colors.grey),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            spacing: 15,
            children: [
              Text(
                cost,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                deliveryWay,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          Text(
            period,
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ],
      ),
    ],
  );}

  TextFormField buildTextFormField({
    required String hint,
    required Function? validator,
    bool? readOnly,
    Icon? icon
  }) {
    return TextFormField(
    readOnly: readOnly?? false,
    validator: (value) => LValidator.validateFullName(value),
    decoration: InputDecoration(
      suffixIcon: icon,
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
      ),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1)),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
    ),
  );}
}
