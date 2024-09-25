import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/view/bottomnavigationbar/dummy1.dart';
import 'package:doctor_module/view/bottomnavigationbar/dummy2.dart';
import 'package:doctor_module/view/dashboard/dashboard.dart';
import 'package:doctor_module/view/notification/notificationscreen.dart';
import 'package:doctor_module/view/settings/settings/settingsoptions.dart';
import 'package:flutter/material.dart';

int selectedIndex = 0;

class BottomNaviCustomizedWidget extends StatefulWidget {
  const BottomNaviCustomizedWidget({super.key});

  @override
  State<BottomNaviCustomizedWidget> createState() =>
      _BottomNaviCustomizedWidgetState();
}

class _BottomNaviCustomizedWidgetState extends State<BottomNaviCustomizedWidget>
    with TickerProviderStateMixin {
  List<Widget> pages = [
    const DashboardScreen(),
    // const NotificationPage(),
    const Dummy1(),
    const Profilesettings(),
    // const Dummy2(),
  ];
  @override
  void initState() {
    selectedIndex = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: pages[selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            elevation: 30,
            currentIndex: selectedIndex,
            selectedFontSize: 0,
            backgroundColor: const Color(0xff2f353a),
            unselectedFontSize: 0,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.cyan),
            enableFeedback: true,
            showSelectedLabels: true,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard_outlined,
                    // color: selectedIndex == 0 ? appcolor : Colors.grey,
                  ),
                  label: ""),
              // BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.notifications_none_outlined,
              //       color: selectedIndex == 1 ? appcolor : Colors.grey,
              //     ),
              //     label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.safety_check_outlined,
                    // color: selectedIndex == 1 ? appcolor : Colors.grey,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.perm_contact_cal_outlined,
                    // color: selectedIndex == 2 ? appcolor : Colors.grey,
                  ),
                  label: ""),
              // BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.upcoming,
              //       color: selectedIndex == 4 ? appcolor : Colors.grey,
              //     ),
              //     label: ""),
            ],
          ),
        ));
  }
}
