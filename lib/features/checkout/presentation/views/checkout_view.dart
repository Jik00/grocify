import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/checkout/domain/entities/step_entity.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/build_appbar.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/paying_section.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/step_tab_bar.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  static const routeName = '/checkout';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(
        context,
        title: stepsEntities[currentIndex].title,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            StepTabBar(
              onItemTapped: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            PayingSection(),
          ],
        ),
      ),
    );
  }
}
