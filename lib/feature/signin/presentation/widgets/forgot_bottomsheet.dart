// ignore_for_file: use_build_context_synchronously

import 'package:custom_form_w/custom_form_w.dart';
import 'package:doctorhunt/core/services/auth_service.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/custom_snackbar.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/signin/presentation/widgets/reset_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> forgotBottomSheet(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, size: 24),
                      onPressed: () => GoRouter.of(context).pop(),
                      splashRadius: 20,
                    ),
                    Text(
                      "Forgot Password",
                      style: context.responsiveHeadLineMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Enter your email for verification.We'll send a 4-digit code to your email.",
                    style: context.responsiveBodyLarge.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                CustomFormW(
                  formKey: formKey,
                  spacing: 24,
                  showButton: false,
                  children: [
                    CustomTextField(
                      hint: "Enter your email",
                      label: "Email Address",
                      isRequired: true,
                      controller: emailController,
                      type: CustomTextFieldType.email,
                      prefixIcon: const Icon(Icons.email_outlined, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Center(
                  child: CustomButton(
                    title: "Continue",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await AuthService().resetPassword(
                            emailController.text.trim(),
                          );
                          resetBottomSheet(context);
                        } catch (e) {
                          GoRouter.of(context).pop();
                          showSnackBar(
                            context: context,
                            type: SnackBarType.error,
                            message: e.toString(),
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    },
  );
}
