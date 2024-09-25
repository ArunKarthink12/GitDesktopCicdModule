import 'package:doctor_module/controller/appointmentcontroller/appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmenttimingScreen extends StatefulWidget {
  const AppointmenttimingScreen({super.key});

  @override
  State<AppointmenttimingScreen> createState() =>
      _AppointmenttimingScreenState();
}

class _AppointmenttimingScreenState extends State<AppointmenttimingScreen> {
  Appointmentcontroller appointmentcontroller =
      Get.put(Appointmentcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(appointmentcontroller.title.value)],
        ),
      ),
    );
  }
}
