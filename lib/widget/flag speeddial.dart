import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class FlagSpeedDial extends StatefulWidget {
  const FlagSpeedDial({super.key});

  @override
  State<FlagSpeedDial> createState() => _FlagSpeedDialState();
}

class _FlagSpeedDialState extends State<FlagSpeedDial> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      labelsStyle: const TextStyle(fontWeight: FontWeight.bold),
      speedDialChildren: <SpeedDialChild>[
        speedDialSubWidget(
            colorsList: const Color(0xff6495ed),
            icon: Icons.flag,
            label: "Re-Call"),
        speedDialSubWidget(
            colorsList: const Color(0xffd2691e),
            icon: Icons.flag,
            label: "Re-Check"),
        speedDialSubWidget(
            colorsList: const Color(0xffff69b4),
            icon: Icons.flag,
            label: "Re-Run"),
        speedDialSubWidget(
            colorsList: Colors.yellow, icon: Icons.flag, label: "Re-Collect"),
        speedDialSubWidget(
            colorsList: const Color(0xffadff2f),
            icon: Icons.power,
            label: "InterFace"),
        speedDialSubWidget(
            colorsList: const Color(0xfff08080),
            icon: Icons.groups_rounded,
            label: "OutSource"),
        speedDialSubWidget(
            colorsList: Colors.red,
            icon: Icons.hourglass_bottom_outlined,
            label: "TAT"),
        speedDialSubWidget(
            colorsList: Colors.black,
            icon: Icons.width_normal_outlined,
            label: "Default"),
      ],
      closedForegroundColor: Colors.black,
      openForegroundColor: Colors.white,
      closedBackgroundColor: Colors.white,
      openBackgroundColor: Colors.black,
      child: Icon(
        Icons.search,
        size: 18.0.sp,
      ),
    );
  }

  SpeedDialChild speedDialSubWidget({colorsList, label, icon}) {
    return SpeedDialChild(
      child: Icon(
        icon,
      ),
      foregroundColor: colorsList,
      backgroundColor: Colors.white,
      label: label,
      onPressed: () {
        setState(() {});
      },
    );
  }
}
