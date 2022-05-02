import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class Move extends StatefulWidget {
  const Move({Key? key}) : super(key: key);

  @override
  State<Move> createState() => _MoveState();
}

class _MoveState extends State<Move> {
  bool play = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              play = !play;
            });
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Positioned(
                top: 100,
                left: 40,
                width: 80,
                child: PlayingCardView(
                  elevation: 30,
                  card: PlayingCard(
                    Suit.diamonds,
                    CardValue.nine,
                  ),
                ),
              ),
              AnimatedPositioned(
                // height: play ? 100 : 10,
                bottom: play ? MediaQuery.of(context).size.height / 2 : 0,
                left: play ? MediaQuery.of(context).size.width / 2 : 0,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 1200),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      play = !play;
                    });
                  },
                  child: SizedBox(
                    width: 80,
                    child: PlayingCardView(
                      elevation: 30,
                      card: PlayingCard(
                        Suit.clubs,
                        CardValue.two,
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
