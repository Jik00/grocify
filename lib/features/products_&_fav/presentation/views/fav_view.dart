import 'package:flutter/material.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/features/products_&_fav/presentation/views/widgets/fav_consumer.dart';
import 'package:grocify/generated/l10n.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  static const routeName = '/fav-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        title: Text(S.current.fav),
      ),
      body: const FavConsumer(),
    );
  }
}
