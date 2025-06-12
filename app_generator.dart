// ignore_for_file: avoid_print

import 'dart:io';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Error: This script requires a command.');
    print('Run "dart app_generator.dart help" for available commands.');
    exit(1);
  }

  final commandOrFeature = arguments[0].toLowerCase();

  switch (commandOrFeature) {
    case 'cache_helper':
      await createCacheHelper();
      return;
    case 'secure_cache_helper':
      await createSecureCacheHelper();
      return;
    case 'all_cache':
      await createCacheHelper();
      await createSecureCacheHelper();
      return;
    case 'failure':
      await createFailureHelper();
      return;
    case 'help':
      print('''
      Usage: dart app_generator.dart [command]
      Commands:
        help                Show this help message
        cache_helper        Create a CacheHelper class
        secure_cache_helper Create a SecureCacheHelper class
        all_cache           Create both cache helpers
        failure             Create a Failure class
        [feature_name]      Create a feature folder structure
      ''');
      return;
    default:
      await createFeatureStructure(commandOrFeature);
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

Future<void> createFeatureStructure(String featureName) async {
  final safeFeatureName = featureName.replaceAll(' ', '_');
  const baseFeatureDirs = [
    'data/models',
    'data/repository',
    'presentation/manager',
    'presentation/views',
    'presentation/widgets',
  ];

  await createEmptyFeatureFolder();

  for (var subDir in baseFeatureDirs) {
    final dirPath = 'lib/feature/$safeFeatureName/$subDir';
    final directory = Directory(dirPath);
    if (!directory.existsSync()) {
      await directory.create(recursive: true);
      print('Folder Created: $dirPath');
    }
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

// Dependency Management
Future<void> addPackage(String packageName) async {
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    print(
      'Error: pubspec.yaml not found. Please ensure you are in a Flutter/Dart project directory.',
    );
    exit(1);
  }

  final pubspecContent = await pubspecFile.readAsString();
  if (!pubspecContent.contains(RegExp('^\\s*$packageName:', multiLine: true))) {
    print('Adding $packageName to pubspec.yaml...');
    final result = await Process.run('dart', ['pub', 'add', packageName]);
    if (result.exitCode == 0) {
      print('Successfully added $packageName.');
    } else {
      print('Failed to add $packageName: ${result.stderr}');
      exit(1);
    }
  } else {
    print('$packageName is already included in pubspec.yaml.');
  }
}

// Helper Creation
Future<void> createCacheHelper() async {
  await createDirectories(['lib/core/database']);
  await addPackage('shared_preferences');
  await createFileIfNotExists('lib/core/database/cache_helper.dart', '''
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
}

Future<void> createSecureCacheHelper() async {
  await createDirectories(['lib/core/database']);
  await addPackage('flutter_secure_storage');
  await createFileIfNotExists('lib/core/database/secure_cache_helper.dart', '''
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
}

Future<void> createFailureHelper() async {
  await createDirectories(['lib/core/errors']);
  await addPackage('dio');
  await createFileIfNotExists('lib/core/errors/failure.dart', '''
import 'package:dio/dio.dart';

class Failure {
  final String err;

  Failure({required this.err});
}

class ServerFailure extends Failure {
  ServerFailure({required super.err});

  factory ServerFailure.fromDio(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          err: "Connection timed out. Please check your internet connection.",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(err: "Unable to send request. Please try again.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          err: "Server took too long to respond. Please try again.",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          err:
              "SSL certificate error. Please check your connection or contact support.",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(err: "Request was cancelled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
          err: "Connection error. Please check your internet connection.",
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          err: "An unknown error occurred. Please try again later.",
        );
    }
  }

  factory ServerFailure.fromResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return ServerFailure(
        err:
            response["error"]["message"] ??
            "An error occurred. Please try again.",
      );
    } else if (status == 404) {
      return ServerFailure(
        err: "Resource not found. Please check the URL or try again later.",
      );
    } else {
      return ServerFailure(
        err: "An error occurred with status code " + status.toString() + ". Please try again.",
      );
    }
  }
}
''');
}
