import 'package:custom_form_w/custom_form_w.dart';
import 'package:doctorhunt/core/database/secure_cache_helper.dart';
import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/data/models/patient_item_model.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/custom_list_tile.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/patient_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  List<PatientItemModel> patientItems = [
    PatientItemModel(
      image: "assets/images/Ellipse 1.png",
      title: "My self",
      onTap: () {
        print("my self");
      },
    ),
    PatientItemModel(
      image: "assets/images/Ellipse 1.png",
      title: "My child",
      onTap: () {
        print("my child");
      },
    ),
    PatientItemModel(
      image: "assets/images/Ellipse 1.png",
      title: "My wife",
      onTap: () {
        print("my wife");
      },
    ),
    PatientItemModel(
      image: "assets/images/Ellipse 1.png",
      title: "My friend",
      onTap: () {
        print("my friend");
      },
    ),
  ];
  TextEditingController patientNameController = TextEditingController();
  TextEditingController patientNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    patientNameController.dispose();
    patientNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment", style: context.responsiveHeadLineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(child: CustomListTile()),
            SizedBox(height: context.smallSpacing),
            Text(
              "Appointment For",
              style: context.responsiveHeadLineMedium.copyWith(fontSize: 20),
            ),
            SizedBox(height: context.mediumSpacing),
            CustomTextField(
              label: "Patient Name",
              hint: "Enter your name",
              controller: patientNameController,
            ),
            SizedBox(height: context.smallSpacing),
            CustomTextField(
              label: "Contact Number",
              hint: "Enter your number",
              controller: patientNumberController,
            ),
            SizedBox(height: context.smallSpacing),
            Text(
              "Who is the patient?",
              style: context.responsiveHeadLineMedium.copyWith(fontSize: 20),
            ),
            SizedBox(height: context.mediumSpacing),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: patientItems
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PatientItem(patientItemModel: e),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: context.largeSpacing),
            Center(
              child: CustomButton(
                title: "Next",
                onPressed: () async {
                  await SecureCacheHelper.setSecureData(
                    key: "patientName",
                    value: patientNameController.text,
                  );
                  await SecureCacheHelper.setSecureData(
                    key: "patientNumber",
                    value: patientNumberController.text,
                  );
                  GoRouter.of(context).push(AppRoutes.kAppointmentCalendar);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
