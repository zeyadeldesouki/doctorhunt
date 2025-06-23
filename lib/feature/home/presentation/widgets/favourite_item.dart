import 'package:doctorhunt/core/routes/app_routes.dart';
import 'package:doctorhunt/core/utils/constants.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Color(0xffD4CCCC),
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kDoctordetails);
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/Ellipse 1.png"),
            ),
          ),
          SizedBox(height: context.smallSpacing),
          Text(
            "Dr. Shouey",
            style: context.responsiveHeadLineMedium.copyWith(fontSize: 16),
          ),
          Text(
            "Specalist Cardiology",
            style: context.responsiveBodyLarge.copyWith(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
