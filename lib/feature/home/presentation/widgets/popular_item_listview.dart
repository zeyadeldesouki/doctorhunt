import 'package:doctorhunt/feature/home/presentation/widgets/popular_item.dart';
import 'package:flutter/material.dart';

class PopularItemListview extends StatelessWidget {
  const PopularItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: PopularItem(),
          );
        },
      ),
    );
  }
}
