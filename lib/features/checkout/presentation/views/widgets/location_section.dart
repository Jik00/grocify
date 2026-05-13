import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/widgets/custom_form_textfield.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/map_widget.dart';
import 'package:grocify/generated/l10n.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({super.key});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  late LatLngPoint p;
  late String location;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 500.h,
            child: MapWidget(
              initialCenter: LatLngPoint(30.5965, 32.2715), // Ismailia, Egypt
              initialZoom: 13,
              showLayerToggle: true,
              onTap: (LatLngPoint point) {
                p = point;
              },
            ),
          ),
          SizedBox(height: 16.h),
          CustomFormTextfield(
            hintText: S.current.location,
            textInputType: TextInputType.name,
            onSaved: (value) => location = value!,
          ),
        ],
      ),
    );
  }
}
