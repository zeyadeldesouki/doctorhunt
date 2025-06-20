import 'package:doctorhunt/core/utils/app_text_style.dart';
import 'package:doctorhunt/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title});

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        minimumSize: Size(MediaQuery.sizeOf(context).width * 0.7, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyle.bodyMedium.copyWith(color: Colors.white),
      ),
    );
  }
}
