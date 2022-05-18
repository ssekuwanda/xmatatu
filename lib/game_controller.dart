import 'dart:math';
import 'package:card_try/widgets/individual_suit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playing_cards/playing_cards.dart';

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

class GameController extends GetxController {
  // The  pile of cards not yet played
  late RxList deck;
  // The android /AI
  late RxList comp;
  // Normal human playing the game
  late RxList human;
  // A scene contains what has been played
  late RxList scene;

  late final chopper;

  bool _humanTurn = true;
  bool get humanTurn => _humanTurn;

  bool _playedTwo = true;
  bool get playedTwo => _playedTwo;

  final bool _gameOver = false;
  bool get gameOver => _gameOver;

  final bool _validMove = false;

  var _playNext;
  get playNext => _playNext;

  // Starting the game
  @override
  onInit() {
    super.onInit();
    deck = shuffle(standardFiftyTwoCardDeck()).obs;

    if (deck.last.value == CardValue.seven) {
      deck = shuffle(standardFiftyTwoCardDeck()).obs;
    }

    chopper = deck.last;
    comp = deck.sublist(0, 7).obs;
    deck.removeRange(0, 7);

    human = deck.sublist(8, 15).obs;
    deck.removeRange(8, 15);

    scene = [].obs;
    scene.add(comp[1]);
    comp.remove(comp[1]);
  }

  toggleTurns() {
    if (_humanTurn == false) {
      _humanTurn = true;
    } else {
      _humanTurn = false;
    }
    print(_humanTurn);
    update();
  }

  showCardSuitPicker() {
    Get.defaultDialog(
      title: "Pick a Suit",
      barrierDismissible: true,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IndSuit(
            symbol: "♦",
            color: Colors.redAccent.shade700,
          ),
          const IndSuit(
            symbol: "♣",
            color: Colors.black,
          ),
          IndSuit(
            symbol: "♥️",
            color: Colors.redAccent.shade700,
          ),
          const IndSuit(
            symbol: "♠",
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  // Out of cards? draw a card
  loadCard() {
    PlayingCard _card = deck[0];

    human.add(_card);
    deck.remove(_card);

    PlayingCard lastPlayed = scene.last;
    List<PlayingCard> possibles = [];
    for (var i = 0; i < human.length; i++) {
      if (human[i].suit == lastPlayed.suit ||
          human[i].value == lastPlayed.value) {
        possibles.add(human[i]);
      }
    }
    if (possibles.isEmpty) {
      gamePlay();
      _humanTurn = false;
      update();
    }
  }

  loadAfterTwo() {
    PlayingCard _card1 = deck[0];
    human.add(_card1);
    deck.remove(_card1);

    PlayingCard _card2 = deck[1];
    human.add(_card2);
    deck.remove(_card2);
    gamePlay();
    update();
  }

  loadAICards(int numOfCards) {
    PlayingCard _card1 = deck[0];
    PlayingCard _card2 = deck[1];

    comp.add(_card1);
    deck.remove(_card1);
    comp.add(_card2);
    deck.remove(_card2);
    update();
  }

  playAfterLoadAI() {
    PlayingCard _card = deck[0];
    comp.add(_card);
    deck.remove(_card);
    PlayingCard lastPlayed = scene.last;
    if (_card.value == lastPlayed.value || _card.suit == lastPlayed.suit) {
      gamePlay();
      update();
    }
    update();
  }

  addToPlayed(card) {
    human.remove(card);
    scene.add(card);
    update();
  }

  addToPlayedAI(card) {
    comp.remove(card);
    scene.add(card);
    update();
  }

  gameLogic(card) {
    PlayingCard lastPlayed = scene.last;
    if (card.value == lastPlayed.value || card.suit == lastPlayed.suit) {
      addToPlayed(card);
      _humanTurn = false;
      gamePlay();
    } else {
      print("Invalid Move");
    }
  }

  countSuits(List elements) {
    var map = Map();
    elements.forEach((element) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    });
    var thevalue = 0;
    var highSuit;

    map.forEach((k, v) {
      if (v > thevalue) {
        thevalue = v;
        highSuit = k;
      }
    });

    if (highSuit == Suit.clubs) {
      _playNext = "♣";
      update();
    }
    if (highSuit == Suit.diamonds) {
      _playNext = "♦";
      update();
    }
    if (highSuit == Suit.clubs) {
      _playNext = "♣";
      update();
    }
    if (highSuit == Suit.hearts) {
      _playNext = "♥️";
      update();
    }
    if (highSuit == Suit.clubs) {
      _playNext = "♠";
      update();
    }
  }

  // Game AI
  gamePlay() async {
    await Future.delayed(const Duration(milliseconds: 1200), () {
      PlayingCard lastPlayed = scene.last;
      List<PlayingCard> possibles = [];
      List<PlayingCard> twosList = [];
      List<PlayingCard> acesList = [];

      // Possible cards to play
      for (var i = 0; i < comp.length; i++) {
        if (comp[i].suit == lastPlayed.suit ||
            comp[i].value == lastPlayed.value) {
          possibles.add(comp[i]);
        }
      }
      if (lastPlayed.value == CardValue.two && possibles.isNotEmpty) {
        if (possibles.contains(CardValue.two)) {
          for (var i = 0; i < possibles.length; i++) {
            if (possibles[i].value == CardValue.two) {
              twosList.add(possibles[i]);
              addToPlayedAI(twosList[0]);
            }
          }
        } else {
          loadAICards(2);
        }
      } else if (possibles.isNotEmpty) {
        addToPlayedAI(possibles[0]);
      } else if (comp.contains(CardValue.ace)) {
        for (var i = 0; i < possibles.length; i++) {
          if (possibles[i].value == CardValue.ace) {
            acesList.add(possibles[i]);
            PlayingCard playThisSuit = countSuits(comp);
            addToPlayedAI(acesList[0]);
          }
        }
      } else {
        loadAICards(1);
      }
    });
  }
}


  // if (possibles[0].value == CardValue.two) {
          
  //         List<PlayingCard> twosList = [];
  //         for (var i = 0; i < human.length; i++) {
  //           if (human[i].value == CardValue.two) {
  //             twosList.add(comp[i]);
  //           }
  //         }
  //         if (twosList.isEmpty) {
  //           loadAfterTwo();
  //         } else {}
  //       } else {
  //         addToPlayedAI(possibles[0]);
  //       }