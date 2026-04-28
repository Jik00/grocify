import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/features/home/domain/entities/category_entity.dart';

class CategoriesDropList extends StatefulWidget {
  const CategoriesDropList({super.key, required this.cat});

  final String cat;

  @override
  State<CategoriesDropList> createState() => _CategoriesDropListState();
}

class _CategoriesDropListState extends State<CategoriesDropList> {
  late int selectedIndex;
  List<String> categoriesNames = categories.map((e) => e.name).toList();

  @override
  void initState() {
    super.initState();
    selectedIndex = categoriesNames.indexWhere((element) => element == widget.cat);
  }

  @override
  void didUpdateWidget(covariant CategoriesDropList oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update if the parent widget changes the cat value
    if (oldWidget.cat != widget.cat) {
      selectedIndex = categoriesNames.indexWhere((element) => element == widget.cat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      underline: SizedBox(height: 0.h),
      dropdownColor: Colors.white,
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(12.r),
      value: selectedIndex != -1 ? selectedIndex : null,
      items: List.generate(
        categoriesNames.length,
        (index) => DropdownMenuItem(
          value: index,
          child: Center(
            child: Text(
              categoriesNames[index],
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.green),
      onChanged: (newValue) {
        setState(() {
          selectedIndex = newValue!;
        });
      },
    );
  }
}