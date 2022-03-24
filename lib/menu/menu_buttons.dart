import 'package:card_try/menu/ui/button_banner.dart';
import 'package:flutter/material.dart';

import 'ui/primary_button.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: PrimaryButton(
            buttonText: "new",
            buttonIcon: Icons.person,
            buttonPress: () => print("Hello"),
            buttonGradient: const LinearGradient(
              colors: [Color(0xffFF5F6D), Color(0xffFFC371)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: PrimaryButton(
            buttonText: "Multiple Player",
            buttonIcon: Icons.phone_android_outlined,
            buttonPress: () => print("Multi"),
            buttonGradient: const LinearGradient(
              colors: [Color(0xffE33E49), Color(0xff9B00B5)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              PrimaryButton(
                buttonText: "Online",
                buttonIcon: Icons.people,
                buttonPress: () {
                  // Do nothing
                },
                buttonGradient: const LinearGradient(
                  colors: [Color(0xff9534E1), Color(0xff009E95)],
                ),
              ),
              ButtonBanner("Comiiing Soon"),
            ],
          ),
        ),
      ],
    );
  }
}
