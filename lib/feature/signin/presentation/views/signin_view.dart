// ignore_for_file: use_build_context_synchronously

import 'package:custom_form_w/custom_form_w.dart';
import 'package:doctorhunt/core/database/secure_cache_helper.dart';
import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:doctorhunt/core/services/auth_service.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/custom_snackbar.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/signin/presentation/widgets/forgot_bottomsheet.dart';
import 'package:doctorhunt/feature/signup/presentation/widgets/signup_types.dart';
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
                style: context.responsiveHeadLineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "You can search course, apply course and find\n scholarship for abroad studies",
                style: context.responsiveBodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.largeSpacing),
              const SignTypes(),
              SizedBox(height: context.largeSpacing),
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
              SizedBox(height: context.mediumSpacing),
              InkWell(
                onTap: () {
                  forgotBottomSheet(context);
                },
                child: Text(
                  "Forgot password?",
                  style: context.responsiveBodyLarge,
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: context.responsiveBodyLarge,
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.kSignup);
                    },
                    child: Text(
                      "Join us",
                      style: context.responsiveBodyLarge.copyWith(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.smallSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
