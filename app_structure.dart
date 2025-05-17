import 'dart:io';
import 'package:flutter/material.dart';

void createFeatureStructure(String featureName) {
  // Base feature directory structure
  final baseFeatureDirs = [
    'data/models',
    'data/repository',
    'presentation/manager',
    'presentation/views',
    'presentation/widgets',
  ];

  // Create directories for the specified feature
  for (var subDir in baseFeatureDirs) {
    final dirPath = 'lib/feature/$featureName/$subDir';
    final directory = Directory(dirPath);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      debugPrint('Folder Created: $dirPath');
    }
  }
}

void createAssetsStructure() {
  final assetsDirs = [
    'assets/images',
    'assets/icons',
    'assets/fonts',
    'assets/animations',
    'assets/sounds',
    'assets/videos',
    'assets/documents',
  ];

  // Create assets directories
  for (var dir in assetsDirs) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      debugPrint('Folder Created: $dir');
    }
  }
}

void createFileIfNotExists(String path, String content) {
  final file = File(path);
  if (!file.existsSync()) {
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
    debugPrint('File Created: $path');
  }
}

void main() {
  final directories = [
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

  // Create core directories
  for (var dir in directories) {
    final directory = Directory(dir);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      debugPrint('Folder Created: $dir');
    }
  }

  // Create feature structures
  final features = ['onboarding', 'home','sign up','login'];
  for (var feature in features) {
    createFeatureStructure(feature);
  }

  // Create assets structure
  createAssetsStructure();

  // Create all files only if they don't exist
  createFileIfNotExists('lib/app/app_name.dart', '''
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

  createFileIfNotExists('lib/main.dart', '''
import 'package:flutter/material.dart';
import 'app/app_name.dart';
void main() {
  runApp(const MyApp());
}
''');

  createFileIfNotExists('lib/core/utils/app_styles.dart', '''
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
''');

  createFileIfNotExists('lib/core/database/cache_helper.dart', '''
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required dynamic value}) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw UnsupportedError('Unsupported Type');
    }
  }

  static String? getString({required String key}) {
    return _prefs.getString(key);
  }

  static bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }

  static int? getInt({required String key}) {
    return _prefs.getInt(key);
  }

  static double? getDouble({required String key}) {
    return _prefs.getDouble(key);
  }

  static List<String>? getStringList({required String key}) {
    return _prefs.getStringList(key);
  }

  static Future<bool> delete({required String key}) async {
    return await _prefs.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await _prefs.clear();
  }
}
''');

  createFileIfNotExists('lib/core/database/secure_cache_helper.dart', '''
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheHelper {
  static const _storage = FlutterSecureStorage();

  static Future<void> setSecureData({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> getSecureData({required String key}) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteSecureData({required String key}) async {
    return await _storage.delete(key: key);
  }

  static Future<void> deleteAllSecureData() async {
    return await _storage.deleteAll();
  }
}
''');

  createFileIfNotExists('lib/core/errors/failure.dart', '''
import 'package:dio/dio.dart';

class Failure {
  final String err;

  Failure({required this.err});
}

class Serverfailure extends Failure {
  Serverfailure({required super.err});

  factory Serverfailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailure(
          err: "Connection timed out. Please check your internet connection.",
        );
      case DioExceptionType.sendTimeout:
        return Serverfailure(err: "Unable to send request. Please try again.");
      case DioExceptionType.receiveTimeout:
        return Serverfailure(
          err: "Server took too long to respond. Please try again.",
        );
      case DioExceptionType.badCertificate:
        return Serverfailure(
          err:
              "SSL certificate error. Please check your connection or contact support.",
        );
      case DioExceptionType.badResponse:
        return Serverfailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return Serverfailure(err: "Request was cancelled. Please try again.");
      case DioExceptionType.connectionError:
        return Serverfailure(
          err: "Connection error. Please check your internet connection.",
        );
      case DioExceptionType.unknown:
        return Serverfailure(
          err: "An unknown error occurred. Please try again later.",
        );
    }
  }

  factory Serverfailure.fromResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return Serverfailure(
        err:
            response["error"]["message"] ??
            "An error occurred. Please try again.",
      );
    } else if (status == 404) {
      return Serverfailure(
        err: "Resource not found. Please check the URL or try again later.",
      );
    } else {
      return Serverfailure(
        err: "An error occurred with status code " +  status.toString() +". " +"Please try again.",
      );
    }
  }
}
''');

  createFileIfNotExists('lib/core/utils/custom_snackbar.dart', '''
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
