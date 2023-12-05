import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                controller.testGet();
              },
              child: Text("Tombol GET"),
            ),
            MaterialButton(
              onPressed: () {
                controller.testListGet();
              },
              child: Text("Tombol GET LIST"),
            ),
            Obx(() => Text(controller.result.value))
          ],
        ),
      ),
    );
  }
}
