import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';

class FeatureDoctorItem extends StatelessWidget {
  const FeatureDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Padding(
          padding: context.allPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red[400], size: 30),
                ),
              ),
              SizedBox(height: context.smallSpacing),
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.0Zdsu_BcU290xG4vk_r97QHaE8?w=261&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                ),
              ),
              SizedBox(height: context.smallSpacing),
              Text(
                "data",
                style: context.responsiveHeadLineMedium.copyWith(fontSize: 16),
              ),
              SizedBox(height: context.smallSpacing),
              Text("price", style: context.responsiveBodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}
