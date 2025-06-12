import 'package:doctorhunt/core/utils/custom_button.dart';
import 'package:doctorhunt/core/utils/responsive_extension.dart';
import 'package:doctorhunt/feature/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<OnboardingModel> items = [
    OnboardingModel(
      image: "assets/images/Ellipse 1.png",
      title: "Find Trusted Doctors",
    ),
    OnboardingModel(
      image: "assets/images/Ellipse 2.png",
      title: "Choose Best Doctors",
    ),
    OnboardingModel(
      image: "assets/images/Ellipse 3.png",
      title: "Easy Appointments",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(items[index].image),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                  Text(
                    items[index].title,
                    style: context.responsiveHeadLineMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Contrary to popular belief, Lorem Ipsum is not",
                    style: context.responsiveBodyLarge,
                  ),
                  Text(
                    " simply random text. It has roots in a piece of it",
                    style: context.responsiveBodyLarge,
                  ),
                  Text(
                    "over 2000 years old.",
                    style: context.responsiveBodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const Expanded(child: SizedBox()),
                  CustomButton(title: "Get Started", onPressed: () async {}),
                  const SizedBox(height: 10),
                  Text("Skip", style: context.responsiveBodyLarge),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
