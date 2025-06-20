import 'package:doctorhunt/feature/home/presentation/widgets/feature_doctor_item.dart';
import 'package:flutter/material.dart';

class FeatureDoctorItemListview extends StatelessWidget {
  const FeatureDoctorItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FeatureDoctorItem(),
          );
        },
      ),
    );
  }
}
