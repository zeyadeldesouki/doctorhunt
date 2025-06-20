import 'package:doctorhunt/core/database/secure_cache_helper.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        SecureCacheHelper.getSecureData(key: "name"),
        SecureCacheHelper.getSecureData(key: "email"),
      ]),
      builder: (context, snapshot) {
        final name = snapshot.data?[0] ?? "Guest";
        final email = snapshot.data?[1] ?? "Guest@gmail.com";
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xff07D9AD),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                trailing: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/app icon.png'),
                ),
                title: Text(
                  "Hi $name",
                  style: context.responsiveHeadLineMedium.copyWith(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  "Find Your Doctor",
                  style: context.responsiveHeadLineMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: InkWell(
                      onTap: () {
                        searchController.clear();
                      },
                      child: const Icon(Icons.close),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
