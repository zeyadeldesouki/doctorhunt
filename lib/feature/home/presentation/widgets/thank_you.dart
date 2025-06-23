import 'package:doctorhunt/core/utils/constants.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: primaryColor, size: 100),
              const SizedBox(height: 20),
              Text(
                'Thank You !',
                style: context.responsiveHeadLineLarge.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 15),
              Text(
                'Your Appointment Successful',
                textAlign: TextAlign.center,
                style: context.responsiveBodyLarge.copyWith(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(title: "Done", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
