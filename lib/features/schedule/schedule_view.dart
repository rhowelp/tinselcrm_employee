import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight + 70,
            child: Container(
              color: ColorPalette.primaryColor,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(70),
                  Row(
                    children: [
                      Gap(20),
                      Text(
                        'Schedule',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Schedule'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
