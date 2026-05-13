import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/widgets/custom_container_full_w.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/location_section.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/order_success.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/order_summary.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/paying_section.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/step_tab_bar.dart';
import 'package:grocify/generated/l10n.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.onStepChange});

  final ValueChanged<int> onStepChange;

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentIndex = 0, currentTap = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StepTabBar(selectedIndex: currentIndex),
          SizedBox(height: 32.h),
          SizedBox(
            height: 600.h,
            child: Stack(
              children: [
                PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  itemCount: getPages().length,
                  itemBuilder: (BuildContext context, int index) {
                    return getPages()[index];
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100.h),
                    child: GestureDetector(

                      onTap: () {
                        if (currentIndex < getPages().length - 1) {
                          setState(() {
                            if (currentTap < 3) {
                              currentTap++;
                              widget.onStepChange(currentTap);
                            }
                          });
                          currentIndex++;
                          pageController.animateToPage(currentIndex,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        }
                        else {
                          debugPrint("Navigate to home");
                        }
                      },
                      child: CustomContainerFullWidth(
                        child: Text(
                          currentIndex == getPages().length - 2
                              ? S.current.placeOrder
                              : currentIndex == getPages().length - 1 ? S.current.continueShopping : S.current.next,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> getPages() => [
      ShippingSection(),
      LocationSection(),
      PayingSection(),
      OrderSummary(),
      OrderSuccess(),
    ];
