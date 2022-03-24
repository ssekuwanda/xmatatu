import 'package:card_try/menu/menu_bg.dart';
import 'package:card_try/menu/menu_buttons.dart';
import 'package:card_try/menu/title.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MenuBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // App Title
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: TitleWidget(),
                    ),
                  ),
                  MenuButtons(),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 55,
          //   right: 32,
          //   left: 32,
          //   child: const MenuSettings(),
          // ),
        ],
      ),
    );
  }
}
