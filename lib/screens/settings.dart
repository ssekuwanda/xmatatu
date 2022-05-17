import 'package:card_try/controllers/settings_controller.dart';
import 'package:card_try/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Dependency injection
  SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SettingsController>(builder: (_) {
              return Text(controller.x.toString());
            }),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent,
                ),
                child: const Center(
                    child: Text(
                  'Tap Me',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
              onTap: () {
                controller.increaseX();
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent,
                ),
                child: const Center(
                    child: Text(
                  'Go To Second Page',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
              onTap: () {
                Get.to(() => Test());
              },
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent,
                ),
                child: const Center(
                    child: Text(
                  'Tap Me',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
