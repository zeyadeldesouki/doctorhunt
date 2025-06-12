import 'package:device_preview/device_preview.dart';
import 'package:doctorhunt/app/doctor_hunt.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/errors/crash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      CrashView(errorDetails: details);
  runApp(DevicePreview(builder: (context) => const MyApp()));
}
