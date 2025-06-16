import 'package:doctorhunt/core/utils/responsive_extension.dart';
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
              style: context.responsiveTitleLarge.copyWith(
                color: kDebugMode ? Colors.red : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              kDebugMode
                  ? 'https://docs.flutter.dev/testing/errors'
                  : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
              textAlign: TextAlign.center,
              style: context.responsiveBodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
