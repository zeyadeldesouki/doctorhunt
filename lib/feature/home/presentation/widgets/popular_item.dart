import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              "https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?ga=GA1.1.220360408.1741291641&semt=ais_hybrid&w=740",
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width * 0.35,
              height: MediaQuery.sizeOf(context).height * 0.18,
            ),
            SizedBox(height: context.smallSpacing),
            Text(
              "Dr. Fillerup Grab",
              style: context.responsiveHeadLineMedium.copyWith(fontSize: 16),
            ),
            SizedBox(height: context.smallSpacing),
            Text("Medicine Specialist", style: context.responsiveBodyLarge),
          ],
        ),
      ),
    );
  }
}
