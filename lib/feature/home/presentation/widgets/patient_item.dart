import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/data/models/patient_item_model.dart';
import 'package:flutter/material.dart';

class PatientItem extends StatelessWidget {
  const PatientItem({super.key, required this.patientItemModel});

  final PatientItemModel patientItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: patientItemModel.onTap,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(patientItemModel.image),
          ),
        ),
        Text(
          patientItemModel.title,
          style: context.responsiveBodyLarge.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
