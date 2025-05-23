import 'package:device_preview/device_preview.dart';
import 'package:doctorhunt/app/doctor_hunt.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DevicePreview(builder: (context) => const DoctorHunt()));
}
