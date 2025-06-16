import 'package:doctorhunt/feature/signup/data/models/signup_model.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.signupModel});

  final SignupModel signupModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: signupModel.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(signupModel.image, width: 25),
            const SizedBox(width: 10),
            Text(signupModel.text),
          ],
        ),
      ),
    );
  }
}
