import 'dart:math';
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

  final bool _gameOver = false;
  bool get gameOver => _gameOver;

  final bool _validMove = false;

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
    human = deck.sublist(8, 15).obs;
    scene = [].obs;
    scene.add(comp[1]);
    comp.remove(comp[1]);
  }

  showCardSuitPicker() {
    Get.defaultDialog(
      title: "Pick a Suit",
      barrierDismissible: true,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("♦",
              style: TextStyle(
                  fontSize: 47,
                  fontFamily: 'KleeOne',
                  color: Colors.redAccent[700])),
          const Text("♣",
              style: TextStyle(
                fontSize: 47,
                fontFamily: 'KleeOne',
                color: Colors.black,
              )),
          Text("♥️",
              style: TextStyle(
                  fontSize: 47,
                  fontFamily: 'KleeOne',
                  color: Colors.redAccent[700])),
          const Text("♠",
              style: TextStyle(
                fontSize: 47,
                fontFamily: 'KleeOne',
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  // Out of cards? draw a card
  loadCard() {
    human.add(deck[0]);
    deck.remove(deck[0]);
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

  loadCard2() {
    comp.add(deck[0]);
    deck.remove(comp.last);
    if (_humanTurn = false) {
      gamePlay();
    }
    _humanTurn = true;
    update();
  }

  playAfterLoadAI() {
    comp.add(deck[0]);
    deck.remove(deck[0]);
    PlayingCard lastPlayed = scene.last;
    List<PlayingCard> possibles = [];
    for (var i = 0; i < comp.length; i++) {
      if (comp[i].suit == lastPlayed.suit ||
          comp[i].value == lastPlayed.value) {
        possibles.add(comp[i]);
      }
    }
    if (possibles.isNotEmpty) {
      gamePlay();
      // _humanTurn = true;
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

  // Game AI
  gamePlay() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      PlayingCard lastPlayed = scene.last;
      List<PlayingCard> possibles = [];
      for (var i = 0; i < comp.length; i++) {
        if (comp[i].suit == lastPlayed.suit ||
            comp[i].value == lastPlayed.value) {
          possibles.add(comp[i]);
        }
      }
      if (_humanTurn == false && possibles.isNotEmpty) {
        addToPlayedAI(possibles[0]);
        _humanTurn = true;
        update();
      } else {
        playAfterLoadAI();
      }
    });
  }
}
