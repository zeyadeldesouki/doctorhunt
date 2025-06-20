import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Ellipse 1.png"),
              fit: BoxFit.cover,
            ),
            color: Color(0xff07D9AD),
          ),
        ),
      ),
      title: Text(
        "Dr. John Doe",
        style: context.responsiveHeadLineMedium.copyWith(fontSize: 20),
      ),
      subtitle: Text("Cardiologist", style: context.responsiveBodyLarge),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.favorite, color: Color(0xffB9B9B9)),
      ),
    );
  }
}
