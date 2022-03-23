import 'package:card_try/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playing_cards/playing_cards.dart';

class Matatu extends StatefulWidget {
  Matatu({Key? key}) : super(key: key);

  @override
  _MatatuState createState() => _MatatuState();
}

class _MatatuState extends State<Matatu> {
  final GameController newdeck = Get.put(GameController());
  @override
  Widget build(BuildContext context) {
    ShapeBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.black54,
        ));
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                child: Obx(
                  () => FlatCardFan(
                      children: newdeck.deck
                          .getRange(0, 6)
                          .toList()
                          .map(
                            (e) => PlayingCardView(
                              card: e,
                              shape: shape,
                            ),
                          )
                          .toList()),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Container()),
                  Container(
                    child: Obx(() => PlayingCardView(card: newdeck.deck.last)),
                    height: 150,
                  ),
                ],
              ),
              Container(
                height: 150,
                child: Obx(
                  () => FlatCardFan(
                      children: newdeck.deck
                          .getRange(7, 14)
                          .toList()
                          .map(
                            (e) => PlayingCardView(
                              card: e,
                              shape: shape,
                            ),
                          )
                          .toList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
