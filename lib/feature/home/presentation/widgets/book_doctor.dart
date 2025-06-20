import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class BookDoctor extends StatelessWidget {
  const BookDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const CustomListTile(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff07D9AD),
                minimumSize: Size(MediaQuery.sizeOf(context).width * 0.5, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Book Now",
                style: context.responsiveBodyMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
