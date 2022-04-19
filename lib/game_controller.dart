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
  // The  pile of cards not yet played
  late RxList deck;
  // The android /AI
  late RxList comp;
  // Normal human playing the game
  late RxList human;
  // A scene contains what has been played
  late RxList scene;

  bool _humanTurn = true;
  bool get humanTurn => _humanTurn;

  // Starting the game
  @override
  onInit() {
    super.onInit();
    // On start shuffle the game cards
    deck = shuffle(standardFiftyTwoCardDeck()).obs;
    // Serve 7 cards to the players
    comp = deck.sublist(0, 7).obs;
    human = deck.sublist(8, 15).obs;
    // Initiate the scene to have zero cards
    scene = [].obs;
    // first player has played the first card
    scene.add(comp[1]);
    comp.remove(comp[1]);
  }

  // Out of cards? load more cards
  loadCard() {
    human.add(deck[0]);
    deck.remove(deck[0]);
    update();
  }

  addToPlayed(card) {
    human.remove(card);
    scene.add(card);

    update();
  }

  gamePlay() {}
}
