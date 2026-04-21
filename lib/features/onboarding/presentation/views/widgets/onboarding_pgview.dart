import 'package:flutter/material.dart';
import 'package:grocify/core/utils/app_images.dart';
import 'package:grocify/core/utils/context_extensions.dart';
import 'package:grocify/features/onboarding/presentation/views/widgets/pg_view_item.dart';

class OnboardingPgview extends StatelessWidget {
  const OnboardingPgview({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const PageScrollPhysics(),
      children: [
        PgViewItem(
            img: Assets.assetsImagesOnboarding1,
            title: context.loc.onboarding1Title,
            subtitle: context.loc.onboarding1Subtitle),
        PgViewItem(
            img: Assets.assetsImagesOnboarding2,
            title: context.loc.onboarding2Title,
            subtitle: context.loc.onboarding2Subtitle),
      ],
    );
  }
}
