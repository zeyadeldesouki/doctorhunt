import 'package:doctorhunt/feature/sign%20up/data/models/signup_model.dart';
import 'package:doctorhunt/feature/sign%20up/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class SignupTypes extends StatelessWidget {
  const SignupTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomContainer(
            signupModel: SignupModel(
              image: "assets/images/google.png",
              text: "Google",
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomContainer(
            signupModel: SignupModel(
              image: "assets/images/facebook.png",
              text: "Facebook",
            ),
          ),
        ),
      ],
    );
  }
}
