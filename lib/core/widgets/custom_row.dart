import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/data/models/custom_row_model.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.customRowModel});

  final CustomRowModel customRowModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          customRowModel.title,
          style: context.responsiveHeadLineMedium.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: customRowModel.onPressed,
          child: Text(
            customRowModel.subtitle,
            style: context.responsiveBodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
