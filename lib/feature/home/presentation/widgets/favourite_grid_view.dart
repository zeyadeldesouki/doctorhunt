import 'package:doctorhunt/feature/home/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';

class FavouriteGridView extends StatelessWidget {
  const FavouriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return const FavouriteItem();
      },
    );
  }
}
