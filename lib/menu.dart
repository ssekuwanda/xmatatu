import 'package:card_try/widgets/menu_buttons.dart';
import 'package:card_try/widgets/menu_settings.dart';
import 'package:card_try/widgets/title.dart';
import 'package:flutter/material.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff1E3C72), Color(0xff2A5298)],
              ),
            ),
          ),
          const Positioned(
            top: 50,
            right: 2,
            left: 295,
            child: MenuSettings(),
          ),
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
        ],
      ),
    );
  }
}
