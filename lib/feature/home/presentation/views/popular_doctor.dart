import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/core/widgets/custom_row.dart';
import 'package:doctorhunt/feature/home/data/models/custom_row_model.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/custom_list_tile.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/popular_item_listview.dart';
import 'package:flutter/material.dart';

class PopularDoctor extends StatelessWidget {
  const PopularDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomRow(
              customRowModel: CustomRowModel(
                title: "Popular Doctors",
                subtitle: "See all",
              ),
            ),
          ),
          const PopularItemListview(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Category", style: context.responsiveHeadLineMedium),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CustomListTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
