import 'package:flutter/material.dart';

class Dummy2 extends StatefulWidget {
  const Dummy2({super.key});

  @override
  State<Dummy2> createState() => _Dummy2State();
}

class _Dummy2State extends State<Dummy2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Image.asset(
              "images/Ayurveda__Counselling__Reiki__Yoga___Meditation___Ananda_Wellness-removebg-preview.png"),
        ),
      ),
    );
  }
}
