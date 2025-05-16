import 'package:doctorhunt/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Hunt',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnboardingView(),
    );
  }
}
