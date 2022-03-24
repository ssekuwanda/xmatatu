import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
  late RxList deck;
  late RxList comp;
  late RxList human;
  RxList scene = [].obs;

  @override
  onInit() {
    super.onInit();
    deck = shuffle(standardFiftyTwoCardDeck()).obs;
    comp = deck.sublist(0, 6).obs;
    human = deck.sublist(7, 13).obs;
    scene = [].obs;
  }

  addToPlayed(card) {
    human.remove(card);
    scene.add(card);
  }
}

// List deck = shuffle(standardFiftyTwoCardDeck());
 // List comp = deck.getRange(0, 6).toList();
  // List human = deck.getRange(7, 13).toList();
  // List otherDeck = deck.getRange(14, 51).toList();
  // List played = [];
