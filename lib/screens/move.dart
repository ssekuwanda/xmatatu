import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class Move extends StatefulWidget {
  const Move({Key? key}) : super(key: key);

  @override
  State<Move> createState() => _MoveState();
}

class _MoveState extends State<Move> {
  bool play = false;
  double boxX = -1;
  double boxY = -1;

  void _moveBox() {
    setState(() {
      boxX = 1;
      boxY = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: _moveBox,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  alignment: Alignment(boxX, boxY),
                  child: Container(
                    width: 120,
                    child: PlayingCardView(
                      elevation: 30,
                      card: PlayingCard(
                        Suit.diamonds,
                        CardValue.nine,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
