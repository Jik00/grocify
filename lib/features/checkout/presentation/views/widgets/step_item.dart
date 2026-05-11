import 'package:flutter/material.dart';
import 'package:grocify/features/checkout/domain/entities/step_entity.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/active_step.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/inactive_step.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.isSelected, required this.step});

  final bool isSelected;
  final StepEntity step;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveStep(
            step: step,
          )
        : InactiveStep(
            step: step,
          );
  }
}
