import 'package:flutter/material.dart';

class TicTac extends StatefulWidget {
  const TicTac({Key? key}) : super(key: key);

  @override
  State<TicTac> createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AspectRatio(
            aspectRatio: 3,
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                for (var i = 0; i < 9; i++)
                  InkWell(
                    onTap: () {},
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
