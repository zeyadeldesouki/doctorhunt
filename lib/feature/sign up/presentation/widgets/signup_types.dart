// ignore_for_file: use_build_context_synchronously

import 'package:doctorhunt/core/services/auth_service.dart';
import 'package:doctorhunt/core/utils/custom_snackbar.dart';
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
              onTap: () async {
                try {
                  await AuthService().signInWithGoogle();
                  showSnackBar(context: context, type: SnackBarType.success);
                } catch (e) {
                  showSnackBar(
                    context: context,
                    type: SnackBarType.error,
                    message: e.toString(),
                  );
                }
              },
              image: "assets/images/google.png",
              text: "Google",
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomContainer(
            signupModel: SignupModel(
              onTap: () {},
              image: "assets/images/facebook.png",
              text: "Facebook",
            ),
          ),
        ),
      ],
    );
  }
}
