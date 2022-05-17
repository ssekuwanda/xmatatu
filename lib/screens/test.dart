import 'package:card_try/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.x.toString()),
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
