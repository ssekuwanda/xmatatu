import 'dart:math';
import 'package:card_try/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playing_cards/playing_cards.dart';
import 'widgets/card_fan.dart';

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
        // color: Colors.black38,
        width: 0.5,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.green[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 150,
              child: Obx(
                () => CardFan(
                  children: newdeck.comp
                      .map(
                        (e) => PlayingCardView(
                          card: e,
                          showBack: false,
                          shape: shape,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 160,
                  child: newdeck.scene.isEmpty
                      ? const Text("Empty")
                      : Obx(
                          () => Stack(
                            children: newdeck.scene
                                .map(
                                  (e) => Transform.rotate(
                                    angle: Random().nextInt(180) + 1.toDouble(),
                                    child: PlayingCardView(
                                      card: e,
                                      shape: shape,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                ),
                SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      PlayingCardView(
                        card: newdeck.chopper,
                        shape: shape,
                      ),
                      Transform.rotate(
                        angle: 918,
                        child: GestureDetector(
                          onTap: () => newdeck.loadCard(),
                          child: PlayingCardView(
                            card: newdeck.deck.last,
                            shape: shape,
                            showBack: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 150,
              child: Obx(
                () => CardFan(
                  children: newdeck.human
                      .map(
                        (card) => GestureDetector(
                          onTap: () {
                            if (card.value == CardValue.ace) {
                              newdeck.showCardSuitPicker();
                            }
                            newdeck.gameLogic(card);
                          },
                          child: PlayingCardView(
                            card: card,
                            shape: shape,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
