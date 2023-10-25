import 'dart:async';

import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:assessment_zuhayrnoor/controller/getController.dart';
import 'package:assessment_zuhayrnoor/views/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  fetchDataWhileInBackground() async {
    await getQuery().getAllBreeds();
  }

  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await fetchDataWhileInBackground();
      Get.offAll(const HomePage());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/giphy.gif',
              height: Get.height * 0.6,
              width: Get.width * 0.8,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Deliveristo Flutter Frontend Coding Challenge',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 26, color: brown, fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
