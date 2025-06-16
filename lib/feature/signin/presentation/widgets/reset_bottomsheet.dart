// ignore_for_file: use_build_context_synchronously

import 'package:custom_form_w/custom_form_w.dart';
import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:doctorhunt/core/services/auth_service.dart';
import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/custom_snackbar.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> resetBottomSheet(BuildContext context) {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
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
                      "Reset Password",
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
                    "Set the new password for your account so you can login and access all the features.",
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
                      hint: "New Password",
                      label: "New Password",
                      controller: newPasswordController,
                      isRequired: true,
                      type: CustomTextFieldType.password,
                      prefixIcon: const Icon(Icons.lock, size: 20),
                    ),
                    CustomTextField(
                      hint: "Re-enter Password",
                      label: "Re-enter Password",
                      controller: confirmNewPasswordController,
                      type: CustomTextFieldType.password,
                      isConfirmPassword: true,
                      isRequired: true,
                      prefixIcon: const Icon(Icons.lock, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Center(
                  child: CustomButton(
                    title: "Update Password",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await AuthService().updatePassword(
                            newPasswordController.text.trim(),
                          );
                          showSnackBar(
                            context: context,
                            type: SnackBarType.success,
                          );
                          GoRouter.of(context).push(AppRoutes.kHome);
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
