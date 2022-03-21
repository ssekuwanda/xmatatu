import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'dart:math';

class Matatu extends StatefulWidget {
  Matatu({Key? key}) : super(key: key);
  List<Suit> suit = [];

  @override
  _MatatuState createState() => _MatatuState();
}

class _MatatuState extends State<Matatu> {
  List<Suit> suits = Suit.values.map((s) => s).toList();
  List<CardValue> values = CardValue.values.map((s) => s).toList();

  List shuffle(List items) {
    var random = Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    List deck = shuffle(standardFiftyTwoCardDeck());
    List comp = deck.getRange(0, 6).toList();
    List human = deck.getRange(7, 13).toList();
    List otherDeck = deck.getRange(14, 51).toList();
    List played = [];
    ShapeBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Colors.black,
          width: 1,
        ));
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              child: FlatCardFan(
                children: comp
                    .map(
                      (e) => PlayingCardView(
                        card: e,
                        shape: shape,
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              height: 150,
              child: FlatCardFan(
                children: human
                    .map(
                      (e) => PlayingCardView(
                        showBack: true,
                        card: e,
                        shape: shape,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
