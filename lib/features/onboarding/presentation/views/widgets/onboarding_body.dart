import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/auth/presentation/views/signin_view.dart';
import 'package:grocify/features/auth/presentation/views/signup_view.dart';
import 'package:grocify/features/onboarding/presentation/views/widgets/next_button.dart';
import 'package:grocify/features/onboarding/presentation/views/widgets/onboarding_pgview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late PageController pageController;
  var currentPg = 0;

  @override
  void initState() {
    super.initState();

    // initialize controller
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentPg = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingPgview(pageController: pageController),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.maxFinite,
            height: 387.h,
            child: Padding(
              padding: EdgeInsets.only(top: 34.h),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    // textDirection:
                    //     TextDirection.ltr, //important to override when ar
                    controller: pageController,
                    count: 2,
                    effect: ExpandingDotsEffect(
                      dotWidth: 20.w,
                      dotHeight: 8.w,
                      dotColor: AppColors.onboarding2,
                      activeDotColor: AppColors.onboardingGreen,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: NextButton(
                        onTap: () {
                          if (currentPg == 0) {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // Prefs.setBool(kIsOnboardingSeen, true);
                            Navigator.pushReplacementNamed(
                                context, SignInView.routeName);
                            //Navigator.pushNamed(context, SignupView.routeName);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
