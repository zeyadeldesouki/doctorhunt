import 'package:doctorhunt/core/utils/constants.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';

class TimeCircle<T> extends StatelessWidget {
  const TimeCircle({
    super.key,
    required this.items,
    required this.itemHour,
    required this.itemTime,
  });

  final List<T> items;
  final String Function(T) itemHour;
  final String Function(T) itemTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      itemHour(item),
                      style: context.responsiveBodyLarge.copyWith(
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      itemTime(item),
                      style: context.responsiveBodyLarge.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
