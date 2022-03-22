import 'dart:math';

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
  List deck = shuffle(standardFiftyTwoCardDeck()).obs;

  humanCards() {
    return deck.getRange(0, 6).toList();
  }
}

  // List comp = deck.getRange(0, 6).toList();
  // List human = deck.getRange(7, 13).toList();
  // List otherDeck = deck.getRange(14, 51).toList();
  // List played = [];
