import 'package:card_try/matatu.dart';
import 'package:card_try/screens/move.dart';
import 'package:card_try/screens/tic_tak_toe.dart';
import 'package:card_try/widgets/button_banner.dart';
import 'package:card_try/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            buttonText: "SINGLE PLAYER",
            buttonIcon: Icons.person,
            buttonPress: () => Get.to(
              () => Matatu(),
            ),
            buttonGradient: const LinearGradient(
              colors: [Color(0xffFF5F6D), Color(0xffFFC371)],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: PrimaryButton(
            buttonText: "OFFLINE MULTIPLAYER",
            buttonIcon: Icons.phone_android_outlined,
            buttonPress: () => Get.to(
              () => TicTac(),
            ),
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
                buttonText: "ONLINE MULTIPLAYER",
                buttonIcon: Icons.people,
                // buttonPress: () => Get.to(() => Move()),
                buttonGradient: const LinearGradient(
                  colors: [Color(0xff9534E1), Color(0xff009E95)],
                ),
              ),
              ButtonBanner("Coming Soon"),
            ],
          ),
        ),
      ],
    );
  }
}
