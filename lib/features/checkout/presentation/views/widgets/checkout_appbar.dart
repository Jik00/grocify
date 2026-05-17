import 'package:flutter/material.dart';
import 'package:grocify/features/checkout/domain/entities/step_entity.dart';

@override
AppBar buildAppBar(BuildContext context,
    {required ValueNotifier<int> currentIndexValueNotifier}) {
  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.green,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        currentIndexValueNotifier.value == 0
            ? Navigator.of(context).pop()
            : currentIndexValueNotifier.value--;

        debugPrint(currentIndexValueNotifier.value.toString());
      },
      child: const Icon(Icons.arrow_back_ios_new),
    ),
    title: ValueListenableBuilder(
      valueListenable: currentIndexValueNotifier,
      builder: (context, index, _) {
        return Text(stepsEntities[index].title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
      },
    ),
  );
}
