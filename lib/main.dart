import 'package:card_try/matatu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playing_cards/playing_cards.dart';

void main() {
  runApp(GetMaterialApp(home: CardHomeView()));
}

class CardHomeView extends StatefulWidget {
  @override
  _CardHomeViewState createState() => _CardHomeViewState();
}

class _CardHomeViewState extends State<CardHomeView> {
  Suit suit = Suit.spades;
  CardValue value = CardValue.ace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 250,
            child: PlayingCardView(card: PlayingCard(suit, value)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            DropdownButton<Suit>(
                value: suit,
                items: Suit.values
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s.toString())))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    suit = val!;
                  });
                }),
            DropdownButton<CardValue>(
                value: value,
                items: CardValue.values
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s.toString())))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    value = val!;
                  });
                }),
          ]),
          ElevatedButton(
            onPressed: () {
              Get.to(
                () => Matatu(),
              );
            },
            child: Text('MATATU'),
          ),
        ],
      ),
    );
  }
}
