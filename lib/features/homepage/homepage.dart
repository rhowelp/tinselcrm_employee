import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';
import 'package:tinselcrm_employee/features/projects/project_view.dart';
import 'package:tinselcrm_employee/features/schedule/schedule_view.dart';
import 'package:tinselcrm_employee/features/settings/settings_view.dart';
import 'package:tinselcrm_employee/features/time_clock/time_clock_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  int _bottomNavIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          _bottomNavIndex = v;
        },
        children: const [
          const ScheduleView(),
          const TimeClockView(),
          const ProjectView(),
          const UserSettingsView(),
        ],
      ),
      bottomNavigationBar: CircleNavBar(
        activeIndex: _bottomNavIndex,
        activeIcons: [
          Icon(Icons.calendar_month_rounded, color: ColorPalette.primaryColor),
          Icon(Icons.schedule, color: ColorPalette.primaryColor),
          Icon(Icons.folder, color: ColorPalette.primaryColor),
          Icon(Icons.settings, color: ColorPalette.primaryColor),
        ],
        inactiveIcons: [
          Column(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: ColorPalette.primaryColor,
              ),
              Text(
                'Schedule',
                style: TextStyle(
                  color: ColorPalette.primaryColor,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.schedule,
                color: ColorPalette.primaryColor,
              ),
              Text(
                'Time Clock',
                style: TextStyle(
                  color: ColorPalette.primaryColor,
                  fontSize: 10,
                ),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.folder,
                color: ColorPalette.primaryColor,
              ),
              Text(
                'Projects',
                style: TextStyle(
                  color: ColorPalette.primaryColor,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.settings,
                color: ColorPalette.primaryColor,
              ),
              Text(
                'Settings',
                style: TextStyle(
                  color: ColorPalette.primaryColor,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
        onTap: (index) {
          _bottomNavIndex = index;
          pageController.jumpToPage(_bottomNavIndex);
          setState(() {});
        },
        color: Colors.white,
        circleColor: ColorPalette.primaryColor,
        height: 65,
        circleWidth: 60,
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        circleGradient: RadialGradient(
          stops: [0.5, 0.9],
          colors: [
            ColorPalette.white,
            ColorPalette.primaryColor,
          ],
        ),
        shadowColor: Colors.grey,
        elevation: 10,
      ),
    );
  }

  // Widget _bottomIcons({
  //   required String icon,
  //   String title = '',
  //   bool isActiveIcon = true,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.all(5),
  //         decoration: isActiveIcon
  //             ? BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: ColorPalette.primaryColorLight,
  //               )
  //             : null,
  //         child: Container(
  //           padding: isActiveIcon ? const EdgeInsets.all(8) : null,
  //           decoration: const BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: Colors.white,
  //           ),
  //           child: SvgPicture.asset(
  //             icon,
  //             color: isActiveIcon
  //                 ? ColorPalette.primaryColor
  //                 : ColorPalette.grey,
  //           ),
  //         ),
  //       ),
  //       if (isActiveIcon == false)
  //         Text(
  //           title,
  //           style: TextStyle(color: ColorPalette.greyText, fontSize: 10),
  //         ),
  //     ],
  //   );
  // }
}
