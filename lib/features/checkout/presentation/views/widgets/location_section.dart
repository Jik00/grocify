import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/widgets/custom_form_textfield.dart';
import 'package:grocify/features/checkout/presentation/views/widgets/map_widget.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({super.key});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {

  late LatLngPoint p;
  String location = "Location";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 350.h,
            child: MapWidget(
              initialCenter: LatLngPoint(30.5965, 32.2715), // Ismailia, Egypt
              initialZoom: 13,
              showLayerToggle: true,
              onTap: (LatLngPoint point) {
                p = point;
                setState(() {
                  location = "Lat: ${point.latitude}, Long: ${point.longitude}";
                });
              },
            ),
          ),
          SizedBox(height: 16.h),
          CustomFormTextfield(
            hintText:  location,
            textInputType: TextInputType.name,
            onSaved: (value) => location = value!,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
