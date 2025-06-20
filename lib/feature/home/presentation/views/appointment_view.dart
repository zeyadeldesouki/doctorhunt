import 'package:custom_form_w/custom_form_w.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

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
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Text("Appointment For", style: context.responsiveHeadLineMedium),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            const CustomTextField(
              label: "patient name",
              hint: "Enter your name",
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            const CustomTextField(
              label: "Contact Number",
              hint: "Enter your number",
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Text("Who is the patient?", style: context.responsiveHeadLineMedium),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Row(
              children: [
                Container(
                  width: 160,
                  height: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Ellipse 1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  height: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Ellipse 1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            Center(child: CustomButton(title: "Next", onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
