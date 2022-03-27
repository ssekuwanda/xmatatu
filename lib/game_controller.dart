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
  late RxList deck;
  late RxList comp;
  late RxList human;
  late RxList scene;

  @override
  onInit() {
    super.onInit();
    deck = shuffle(standardFiftyTwoCardDeck()).obs;
    comp = deck.sublist(0, 7).obs;
    human = deck.sublist(8, 15).obs;
    scene = [].obs;
    scene.add(comp[1]);
    comp.remove(comp[1]);
  }

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
