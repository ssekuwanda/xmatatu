import 'package:flutter/material.dart';

class CardFan extends StatelessWidget {
  /// Children of the flat fan. Will be arrayed evenly (and potentially stacked) across the width.
  /// Renders from first to last, so the last child will be on top.
  final List<Widget> children;

  /// Creates a flat card fan.
  CardFan({required this.children});

  @override
  Widget build(Object context) {
    return children.length <= 3
        ? Row(
            children: children,
            mainAxisAlignment: MainAxisAlignment.center,
          )
        : Stack(
            children: List.generate(
              children.length,
              (index) => Align(
                alignment:
                    Alignment(-1.0 + (index / (children.length - 1)) * 2.0, 0),
                child: children[index],
              ),
            ),
          );
  }
}
