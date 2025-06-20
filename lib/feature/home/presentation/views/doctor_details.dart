import 'package:doctorhunt/core/utils/constants.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/data/models/custom_container_model.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/book_doctor.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Details", style: context.responsiveHeadLineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BookDoctor(),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DetailsContainer(
                      customContainerModel: CustomContainerModel(
                        title: "100",
                        subtitle: "Running",
                      ),
                    ),
                    const SizedBox(width: 8),
                    DetailsContainer(
                      customContainerModel: CustomContainerModel(
                        title: "500",
                        subtitle: "Ongoing",
                      ),
                    ),
                    const SizedBox(width: 8),
                    DetailsContainer(
                      customContainerModel: CustomContainerModel(
                        title: "700",
                        subtitle: "Patient",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("Services", style: context.responsiveHeadLineMedium),
            const SizedBox(height: 16),
            Text(
              "1.   Patient care should be the number one priority.",
              style: context.responsiveBodyLarge,
            ),
            Divider(color: primaryColor.withValues(alpha: 0.5), thickness: 0.5),
            Text(
              "2.   If you run your practiceyou know how frustrating.",
              style: context.responsiveBodyLarge,
            ),
            Divider(
              color: const Color(0xff677294).withValues(alpha: 0.5),
              thickness: 0.5,
            ),
            Text(
              "3.   That’s why some of appointment reminder system.",
              style: context.responsiveBodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
