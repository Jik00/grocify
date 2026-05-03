import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    
    EdgeInsets.symmetric( horizontal: 16.w),
    child: CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 12.h),
            ],
          ),
        ),

      // SliverToBoxAdapter(
      //   child: SizedBox(
      //     height: 90.h,
      //   ),
      // ),
      
    ],),
    );
  }
}