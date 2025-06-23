import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/core/widgets/custom_row.dart';
import 'package:doctorhunt/feature/home/data/models/custom_row_model.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/favourite_grid_view.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/feature_doctor_item_listview.dart';
import 'package:flutter/material.dart';

class FavouriteDoctor extends StatelessWidget {
  const FavouriteDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite Doctors",
          style: context.responsiveHeadLineMedium.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: context.allPadding,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  const Expanded(child: FavouriteGridView()),
                  CustomRow(
                    customRowModel: CustomRowModel(
                      title: "Feature Doctors",
                      subtitle: "See all",
                    ),
                  ),
                  const Expanded(child: FeatureDoctorItemListview()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
