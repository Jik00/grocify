import 'package:flutter/material.dart';
import 'package:grocify/core/utils/app_colors.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key});

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav = false;
  @override

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            isFav ? Icons.favorite_outlined : Icons.favorite_outline_outlined,
            color: isFav ? AppColors.red : AppColors.grayscale400,
          ),
          onPressed: () {
            setState(() {
              isFav = !isFav;
            });
          },
        ),
      ],
    );
  }
}
