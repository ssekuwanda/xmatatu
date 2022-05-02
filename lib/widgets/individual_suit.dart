import 'package:flutter/material.dart';

class IndSuit extends StatelessWidget {
  final String symbol;
  final double? size = 47.0;
  final font = 'KleeOne';
  final Color color;
  const IndSuit({Key? key, required this.symbol, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      symbol,
      style: TextStyle(
        color: color,
        fontFamily: font,
        fontSize: size,
      ),
    );
  }
}
