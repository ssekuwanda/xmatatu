// import 'package:card_try/widgets/card_fan.dart';
// import 'package:flutter/material.dart';
// import 'package:playing_cards/playing_cards.dart';

// class Move extends StatefulWidget {
//   const Move({Key? key}) : super(key: key);

//   @override
//   State<Move> createState() => _MoveState();
// }

// class _MoveState extends State<Move> {
//   bool play = false;
//   double boxX = -1;
//   double boxY = -1;

//   void _moveBox() {
//     setState(() {
//       boxX = 1;
//       boxY = 1;
//     });
//   }

//   final GlobalKey<AnimatedListState> _key = GlobalKey();

//   List cardie = [
//     PlayingCard(Suit.hearts, CardValue.ace),
//     PlayingCard(Suit.hearts, CardValue.ace),
//     PlayingCard(Suit.hearts, CardValue.ace),
//     PlayingCard(Suit.hearts, CardValue.ace),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: _moveBox,
//                 child: AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   alignment: Alignment(boxX, boxY),
//                   child: Container(
//                     width: 120,
//                     child: PlayingCardView(
//                       elevation: 30,
//                       card: PlayingCard(
//                         Suit.diamonds,
//                         CardValue.nine,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 150,
//                 child: CardFan(
//                   children: cardie
//                       .map(
//                         (card) => GestureDetector(
//                           onTap: () {},
//                           child: PlayingCardView(
//                             key: UniqueKey(),
//                             elevation: 30.9,
//                             card: card,
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//               AnimatedList(
//                   key: _key,
//                   initialItemCount: cardie.length,
//                   itemBuilder: (context, index, animation) {
//                     return _buildItem(cardie[index], animation, index);
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _buildItem(String item, Animation animation, int index) {
//     return Card(
//       elevation: 2,
//       child: ListTile(
//         title: Text(
//           item,
//           style: TextStyle(),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class Move extends StatefulWidget {
//   const Move({Key? key}) : super(key: key);

//   @override
//   State<Move> createState() => _MoveState();
// }

// class _MoveState extends State<Move> {
//   final GlobalKey<AnimatedListState> _key = GlobalKey();

//   final List<String> _items = const [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//     'Item 6',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedList(
//         key: _key,
//         initialItemCount: _items.length,
//         itemBuilder: (context, index, animation) {
//           return _buildItem(_items[index], animation, index);
//         },
//       ),
//     );
//   }

//   Widget _buildItem(String item, int index, Animation animation) {
//     return SizeTransition(
//       sizeFactor: animation,
//       child: Card(
//         elevation: 2,
//         child: ListTile(
//           title: Text(
//             item,
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           subtitle: Text('Lorem Ipsums dolor...'),
//         ),
//       ),
//     );
//   }
// }
