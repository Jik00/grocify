import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimationLottie extends StatefulWidget {
  const CustomAnimationLottie({super.key, required this.lottieFile});

  final String lottieFile;

  @override
  State<CustomAnimationLottie> createState() => _CustomAnimationLottieState();
}

class _CustomAnimationLottieState extends State<CustomAnimationLottie>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isPlaying) {
          _controller.reverse();
        } else {
          _controller.forward();
        }

        isPlaying = !isPlaying;
      },
      child: LottieBuilder.asset(
        widget.lottieFile,
        controller: _controller,
      ),
    );
  }
}
