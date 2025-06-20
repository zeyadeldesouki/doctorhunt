import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:doctorhunt/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: primaryColor,
      onTap: (index) {
        if (index == 1) {
          GoRouter.of(context).push(AppRoutes.kfavourite);
        }
      },
      height: 50,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.bounceInOut,
      buttonBackgroundColor: Colors.green,
      items: const [
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.favorite, size: 30, color: Colors.white),
        Icon(Icons.bookmark, size: 30, color: Colors.white),
        Icon(Icons.message, size: 30, color: Colors.white),
      ],
    );
  }
}
