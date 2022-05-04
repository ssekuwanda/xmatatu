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
        color: Colors.black45,
        width: 0.5,
      ),
    );

    return Scaffold(
      // backgroundColor: Colors.green[900],
      backgroundColor: Colors.green,
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
                          elevation: 30,
                          card: e,
                          showBack: true,
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
                                      elevation: 19,
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
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Transform.rotate(
                          angle: 90 * pi / 180,
                          child: PlayingCardView(
                            card: newdeck.chopper,
                            elevation: 30,
                            shape: shape,
                          ),
                        ),
                      ),
                      Positioned(
                        width: 100,
                        left: 28,
                        child: GestureDetector(
                          onTap: () {
                            newdeck.loadCard();
                          },
                          child: PlayingCardView(
                            card: newdeck.deck.last,
                            elevation: 30,
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
                            setState(() {});
                            if (card.value == CardValue.ace) {
                              newdeck.showCardSuitPicker();
                            }
                            newdeck.gameLogic(card);
                          },
                          child: PlayingCardView(
                            key: UniqueKey(),
                            elevation: 30.9,
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
