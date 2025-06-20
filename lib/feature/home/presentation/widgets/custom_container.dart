import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/data/models/custom_container_model.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key, required this.customContainerModel});

  final CustomContainerModel customContainerModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.25,
        height: 100,
        decoration: const BoxDecoration(color: Color(0xffCBCBCB)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              customContainerModel.title,
              style: context.responsiveHeadLineLarge.copyWith(
                color: Colors.black,
              ),
            ),
            Text(
              customContainerModel.subtitle,
              style: context.responsiveBodyMedium.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
