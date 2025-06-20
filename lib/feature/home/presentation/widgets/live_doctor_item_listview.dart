import 'package:doctorhunt/feature/home/presentation/widgets/live_doctor_item.dart';
import 'package:flutter/material.dart';

class LiveDoctorItemListview extends StatelessWidget {
  const LiveDoctorItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: LiveDoctorItem(),
          );
        },
      ),
    );
  }
}
