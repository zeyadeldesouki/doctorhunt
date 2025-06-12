import 'package:doctorhunt/app/doctor_hunt.dart';
import 'package:flutter/material.dart';
import 'core/errors/crash_view.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      CrashView(errorDetails: details);
  runApp(const MyApp());
}
