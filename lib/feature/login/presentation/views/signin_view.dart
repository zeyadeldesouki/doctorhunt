// ignore_for_file: use_build_context_synchronously

import 'package:custom_form_w/custom_form_w.dart';
import 'package:doctorhunt/core/database/secure_cache_helper.dart';
import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:doctorhunt/core/services/auth_service.dart';
import 'package:doctorhunt/core/utils/app_styles.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/custom_snackbar.dart';
import 'package:doctorhunt/feature/sign%20up/presentation/widgets/signup_types.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
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
                "Welcome back",
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
                    hint: "Enter your email",
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
                title: "Login",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await AuthService().signInWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      );
                      await SecureCacheHelper.setSecureData(
                        key: 'email',
                        value: emailController.text,
                      );
                      await SecureCacheHelper.setSecureData(
                        key: 'password',
                        value: passwordController.text,
                      );
                      debugPrint(
                        await SecureCacheHelper.getSecureData(key: 'email'),
                      );
                      debugPrint(
                        await SecureCacheHelper.getSecureData(key: 'password'),
                      );
                      showSnackBar(
                        context: context,
                        type: SnackBarType.success,
                      );
                    } catch (e) {
                      showSnackBar(
                        context: context,
                        type: SnackBarType.error,
                        message: e.toString(),
                      );
                    }
                  }
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              Text("Forgor password?", style: AppStyles.text14(context)),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppStyles.text14(context),
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.kSignup);
                    },
                    child: Text(
                      "Join us",
                      style: AppStyles.text14(
                        context,
                      ).copyWith(color: Colors.green),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
