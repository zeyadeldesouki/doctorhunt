import 'package:flutter/material.dart';

enum SnackBarType { success, warning, error }

void showSnackBar({
  required BuildContext context,
  required SnackBarType type,
  String? message,
  Color? backgroundColor,
  Color? textColor,
  IconData? icon,
  Color? iconColor,
  double? elevation,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  double? borderRadius,
  Duration? duration,
  SnackBarBehavior? behavior,
  SnackBarAction? action,
  VoidCallback? onVisible,
  TextAlign? textAlign,
  TextStyle? textStyle,
  bool showCloseIcon = false,
  Color? closeIconColor,
  ShapeBorder? shape,
  bool showTypeLabel = true,
}) {
  String defaultMessage;
  Color defaultBackgroundColor;
  Color defaultTextColor;
  IconData defaultIcon;
  Color defaultIconColor;
  Color defaultBorderColor;

  switch (type) {
    case SnackBarType.success:
      defaultMessage = message ?? 'Operation completed successfully';
      defaultBackgroundColor = Colors.green.shade700;
      defaultTextColor = Colors.white;
      defaultIcon = icon ?? Icons.check_circle;
      defaultIconColor = iconColor ?? Colors.white;
      defaultBorderColor = Colors.green.shade400;
      break;
    case SnackBarType.warning:
      defaultMessage = message ?? 'Warning! Please check the details';
      defaultBackgroundColor = Colors.orange.shade700;
      defaultTextColor = Colors.white;
      defaultIcon = icon ?? Icons.warning_amber_rounded;
      defaultIconColor = iconColor ?? Colors.white;
      defaultBorderColor = Colors.orange.shade400;
      break;
    case SnackBarType.error:
      defaultMessage = message ?? 'Oops! An error occurred';
      defaultBackgroundColor = Colors.red.shade700;
      defaultTextColor = Colors.white;
      defaultIcon = icon ?? Icons.error_outline;
      defaultIconColor = iconColor ?? Colors.white;
      defaultBorderColor = Colors.red.shade400;
      break;
  }

  final defaultShape =
      shape ??
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
        side: BorderSide(color: defaultBorderColor, width: 2.0),
      );

  final content = Row(
    children: [
      Icon(defaultIcon, color: defaultIconColor, size: 28),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTypeLabel) ...[
              Text(
                type.toString().split('.').last.toUpperCase(),
                style: TextStyle(
                  color: defaultTextColor.withValues(alpha: 0.9),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 2),
            ],
            Text(
              defaultMessage,
              textAlign: textAlign,
              style:
                  textStyle ??
                  TextStyle(
                    color: textColor ?? defaultTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
      if (showCloseIcon)
        IconButton(
          icon: Icon(
            Icons.close,
            size: 20,
            color: closeIconColor ?? defaultTextColor.withValues(alpha: 0.7),
          ),
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
    ],
  );

  final snackBar = SnackBar(
    content: content,
    backgroundColor: backgroundColor ?? defaultBackgroundColor,
    elevation: elevation ?? 12.0,
    margin:
        margin ??
        (behavior == SnackBarBehavior.floating
            ? const EdgeInsets.all(16)
            : null),
    padding:
        padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    duration: duration ?? const Duration(seconds: 4),
    behavior: behavior ?? SnackBarBehavior.floating,
    shape: defaultShape,
    action: action,
    onVisible: onVisible,
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
