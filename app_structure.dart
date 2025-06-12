// ignore_for_file: avoid_print

import 'dart:io';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    initializeCoreProject();
    createEmptyFeatureFolder();
    return;
  }
}

// File and Directory Utilities
Future<void> createDirectories(List<String> paths) async {
  for (var dir in paths) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      await directory.create(recursive: true);
      print('Folder Created: $dir');
    }
  }
}

Future<void> createEmptyFeatureFolder() async {
  final directory = Directory('lib/feature');
  if (!directory.existsSync()) {
    await directory.create(recursive: true);
    print('Folder Created: lib/feature');
  }
}

Future<void> createFileIfNotExists(String path, String content) async {
  final file = File(path);
  if (!file.existsSync()) {
    await file.create(recursive: true);
    await file.writeAsString(content);
    print('File Created: $path');
  }
}

// Project Initialization Logic
Future<void> initializeCoreProject() async {
  await _createCoreDirectories();
  await createAssetsStructure();
  await _createBaseFiles();
}

Future<void> _createCoreDirectories() async {
  const coreDirs = [
    'lib/app',
    'lib/core/database',
    'lib/core/utils',
    'lib/core/themes',
    'lib/core/services',
    'lib/core/routes',
    'lib/core/locale',
    'lib/core/widgets',
    'lib/core/errors',
  ];
  await createDirectories(coreDirs);
}

Future<void> createAssetsStructure() async {
  const assetsDirs = [
    'assets/images',
    'assets/icons',
    'assets/fonts',
    'assets/animations',
    'assets/sounds',
    'assets/videos',
    'assets/documents',
  ];
  await createDirectories(assetsDirs);
}

Future<void> _createBaseFiles() async {
  await createFileIfNotExists('lib/app/app_name.dart', '''
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
''');

  await createFileIfNotExists('lib/main.dart', '''
import 'package:flutter/material.dart';
import 'core/errors/crash_view.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      CrashView(errorDetails: details);
  runApp(const MyApp());
}
''');

  await createFileIfNotExists('lib/core/utils/app_text_style.dart', '''
import 'package:flutter/material.dart';

class AppTextStyle {
  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.27,
  );

  static const TextStyle headLineMedium = TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.29,
  );

  static const TextStyle headLineLarge = TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle displayLarge = TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );
}
''');

  await createFileIfNotExists('lib/core/utils/responsive_extension.dart', '''
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
''');

  await createFileIfNotExists('lib/core/utils/responsive_helper.dart', '''
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Get responsive value based on screen size
  static T getValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  // Get columns count for grid
  static int getColumnsCount(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  // Get padding based on screen size
  static EdgeInsets getPadding(BuildContext context) {
    return EdgeInsets.all(
      getValue(context, mobile: 10.0, tablet: 24.0, desktop: 32.0),
    );
  }

  // Get responsive font size
  static double getFontSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return getValue(
      context,
      mobile: mobile,
      tablet: tablet ?? mobile * 1.1,
      desktop: desktop ?? mobile * 1.2,
    );
  }
}
''');

  await createFileIfNotExists('lib/core/utils/responsive_widget.dart', '''
import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ResponsiveHelper.desktopBreakpoint) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= ResponsiveHelper.tabletBreakpoint) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
    DeviceType deviceType,
  )
  builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        DeviceType deviceType;

        if (constraints.maxWidth >= ResponsiveHelper.desktopBreakpoint) {
          deviceType = DeviceType.desktop;
        } else if (constraints.maxWidth >= ResponsiveHelper.tabletBreakpoint) {
          deviceType = DeviceType.tablet;
        } else {
          deviceType = DeviceType.mobile;
        }

        return builder(context, constraints, deviceType);
      },
    );
  }
}

enum DeviceType { mobile, tablet, desktop }
''');

  await createFileIfNotExists('lib/core/errors/crash_view.dart', '''
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CrashView extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CrashView({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: context.allPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-1932.jpg?uid=R202867840&ga=GA1.1.220360408.1741291641&semt=ais_items_boosted&w=740',
              errorBuilder: (context, error, stackTrace) => Image.network(
                'https://image.freepik.com/free-vector/404-error-message-computer-screen-illustration-concept_269730-139.jpg',
              ),
            ),
            Text(
              kDebugMode
                  ? errorDetails.summary.toString()
                  : 'Oops! Something went wrong!',
              textAlign: TextAlign.center,
              style: context.responsiveBodyLarge.copyWith(
                color: kDebugMode ? Colors.red : Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              kDebugMode
                  ? 'https://docs.flutter.dev/testing/errors'
                  : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
              textAlign: TextAlign.center,
              style: context.responsiveBodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
''');

  await createFileIfNotExists('lib/core/utils/custom_snackbar.dart', '''
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
''');
}
