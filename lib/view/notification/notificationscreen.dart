import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/view/bottomnavigationbar/bottomnavibar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  back() {
    setState(() {
      selectedIndex = 0;
    });
    Get.toNamed("/bottomnavibar");
    Get.forceAppUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('NOTIFICATION', style: header),
          ),
          body: SingleChildScrollView(
              child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(),
                  ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 12.0.hp,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Notification',
                                          style: notificationTltstyle),
                                      Text(
                                        '5 min ago',
                                        style: notificationtime,
                                      )
                                    ],
                                  ),
                                  Text(
                                      'You have an appointment within 30 mins ',
                                      style: notificationSubStyle)
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ))),
    );
  }
}
