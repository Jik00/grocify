import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/checkout/domain/entities/step_entity.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/step_item.dart';

class StepTabBar extends StatefulWidget {
  const StepTabBar({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<StepTabBar> createState() => _StepTabBarState();
}

class _StepTabBarState extends State<StepTabBar> {
  int selectedIndex = 0;

  final ScrollController _scrollController = ScrollController();

  // Keep a GlobalKey for each item to measure its position
  late final List<GlobalKey> _itemKeys = List.generate(
    stepsEntities.length,
    (_) => GlobalKey(),
  );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToItem(int index) {
    final key = _itemKeys[index];
    final context = key.currentContext;

    if (context != null && _scrollController.hasClients) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        alignment: 0.5, // centers the item in the viewport
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: stepsEntities.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onItemTapped(index);
                  _scrollToItem(index);
                });
              },
              child: Row(
                key: _itemKeys[index],
                mainAxisSize: MainAxisSize.min,
                children: [
                  StepItem(
                    isSelected: selectedIndex >= index,
                    step: entity,
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
