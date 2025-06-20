import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/core/widgets/custom_row.dart';
import 'package:doctorhunt/feature/home/data/models/custom_row_model.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/bottom_bar.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/custom_appbar.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/feature_doctor_item_listview.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/live_doctor_item_listview.dart';
import 'package:doctorhunt/feature/home/presentation/widgets/popular_item_listview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff07D9AD),
        toolbarHeight: 0,
      ),
      bottomNavigationBar: const BottomBar(),
      body: ListView(
        children: [
          const CustomAppbar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Live Doctors",
                  style: context.responsiveHeadLineMedium.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: context.smallSpacing),
                const LiveDoctorItemListview(),
                CustomRow(
                  customRowModel: CustomRowModel(
                    title: "Popular Doctors",
                    subtitle: "See all",
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kpopular);
                    },
                  ),
                ),
                const PopularItemListview(),
                CustomRow(
                  customRowModel: CustomRowModel(
                    title: "Feature Doctors",
                    subtitle: "See all",
                    onPressed: () {},
                  ),
                ),
                const FeatureDoctorItemListview(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
