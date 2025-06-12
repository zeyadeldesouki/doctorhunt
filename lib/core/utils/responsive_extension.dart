import 'package:doctorhunt/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'responsive_helper.dart';

extension ResponsiveTextStyles on BuildContext {
  TextStyle get responsiveDisplayLarge => AppTextStyle.displayLarge.copyWith(
        fontSize: ResponsiveHelper.getFontSize(
          this,
          mobile: 40,
          tablet: 48,
          desktop: 57,
        ),
      );

  TextStyle get responsiveHeadLineLarge => AppTextStyle.headLineLarge.copyWith(
        fontSize: ResponsiveHelper.getFontSize(
          this,
          mobile: 28,
          tablet: 32,
          desktop: 36,
        ),
      );

  TextStyle get responsiveHeadLineMedium => AppTextStyle.headLineMedium.copyWith(
        fontSize: ResponsiveHelper.getFontSize(
          this,
          mobile: 24,
          tablet: 28,
          desktop: 32,
        ),
      );

  TextStyle get responsiveTitleLarge => AppTextStyle.titleLarge.copyWith(
        fontSize: ResponsiveHelper.getFontSize(
          this,
          mobile: 18,
          tablet: 20,
          desktop: 22,
        ),
      );

  TextStyle get responsiveBodyLarge => AppTextStyle.bodyLarge.copyWith(
        fontSize: ResponsiveHelper.getFontSize(
          this,
          mobile: 14,
          tablet: 16,
          desktop: 18,
        ),
      );

  TextStyle get responsiveBodyMedium => AppTextStyle.bodyMedium.copyWith(
        fontSize: ResponsiveHelper.getFontSize(
          this,
          mobile: 12,
          tablet: 14,
          desktop: 16,
        ),
      );
}

extension ResponsiveSpacing on BuildContext {
  // Responsive spacing
  double get smallSpacing =>
      ResponsiveHelper.getValue(this, mobile: 8.0, tablet: 12.0, desktop: 16.0);
  double get mediumSpacing => ResponsiveHelper.getValue(
        this,
        mobile: 16.0,
        tablet: 20.0,
        desktop: 24.0,
      );
  double get largeSpacing => ResponsiveHelper.getValue(
        this,
        mobile: 24.0,
        tablet: 32.0,
        desktop: 40.0,
      );

  // Responsive padding
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getValue(
          this,
          mobile: 16.0,
          tablet: 24.0,
          desktop: 32.0,
        ),
      );
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(
        vertical: ResponsiveHelper.getValue(
          this,
          mobile: 12.0,
          tablet: 16.0,
          desktop: 20.0,
        ),
      );
  EdgeInsets get allPadding => EdgeInsets.all(
        ResponsiveHelper.getValue(this, mobile: 16.0, tablet: 20.0, desktop: 24.0),
      );
}
