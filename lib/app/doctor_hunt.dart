import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Hunt',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: AppRoutes.router,
    );
  }
}
