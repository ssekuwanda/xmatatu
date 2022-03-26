import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'MA',
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'TA',
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
            letterSpacing: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'TU',
          style: TextStyle(
            fontSize: 100,
            color: Colors.white,
            letterSpacing: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
