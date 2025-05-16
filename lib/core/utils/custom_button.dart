import 'package:doctorhunt/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(MediaQuery.sizeOf(context).width * 0.7, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Text(
        "Get Started",
        style: AppStyles.text18(context).copyWith(color: Colors.white),
      ),
    );
  }
}
