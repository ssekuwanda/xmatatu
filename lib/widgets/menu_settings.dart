import 'package:flutter/material.dart';

class MenuSettings extends StatefulWidget {
  const MenuSettings({Key? key}) : super(key: key);

  @override
  State<MenuSettings> createState() => _MenuSettingsState();
}

class _MenuSettingsState extends State<MenuSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(
              Icons.volume_up,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: const [
            Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 14,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "How to play ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: const [
            Icon(
              Icons.language,
              color: Colors.white,
              size: 14,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Language",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
