import 'package:flutter/material.dart';

class AdaptiveTextSize {
  const AdaptiveTextSize();

  double getadaptiveTextSize(BuildContext context, dynamic value) {
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

class AppStyles {
  static TextStyle text14(BuildContext context) {
    const adaptiveTextSize = AdaptiveTextSize();
    return TextStyle(
      fontSize: adaptiveTextSize.getadaptiveTextSize(context, 14),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle text16(BuildContext context) {
    const adaptiveTextSize = AdaptiveTextSize();
    return TextStyle(
      fontSize: adaptiveTextSize.getadaptiveTextSize(context, 16),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle text18(BuildContext context) {
    const adaptiveTextSize = AdaptiveTextSize();
    return TextStyle(
      fontSize: adaptiveTextSize.getadaptiveTextSize(context, 18),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle text20(BuildContext context) {
    const adaptiveTextSize = AdaptiveTextSize();
    return TextStyle(
      fontSize: adaptiveTextSize.getadaptiveTextSize(context, 20),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle text22(BuildContext context) {
    const adaptiveTextSize = AdaptiveTextSize();
    return TextStyle(
      fontSize: adaptiveTextSize.getadaptiveTextSize(context, 22),
      fontWeight: FontWeight.bold,
    );
  }
}
