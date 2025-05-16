import 'package:custom_form_w/custom_form_w.dart';
import 'package:doctorhunt/core/utils/app_styles.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/feature/sign%20up/presentation/widgets/signup_types.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              Text(
                "Join us to start searching",
                style: AppStyles.text22(context),
                textAlign: TextAlign.center,
              ),
              Text(
                "You can search course, apply course and find\n scholarship for abroad studies",
                style: AppStyles.text14(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const SignupTypes(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              CustomFormW(
                formKey: formKey,
                showButton: false,
                children: [
                  CustomTextField(
                    hint: "Enter your name",
                    label: "Name",
                    isRequired: true,
                    controller: nameController,
                  ),
                  CustomTextField(
                    hint: "Enter your Email",
                    label: "Email",
                    isRequired: true,
                    type: CustomTextFieldType.email,
                    controller: emailController,
                  ),
                  CustomTextField(
                    hint: "Enter your password",
                    label: "Password",
                    isRequired: true,
                    type: CustomTextFieldType.password,
                    controller: passwordController,
                    suffixIcon: const Icon(Icons.lock),
                  ),
                ],
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint(nameController.text);
                    debugPrint(emailController.text);
                    debugPrint(passwordController.text);
                  }
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account? ", style: AppStyles.text14(context)),
                  Text(
                    "Login",
                    style: AppStyles.text14(
                      context,
                    ).copyWith(color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
