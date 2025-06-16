import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      title: 'Doctor Hunt',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
