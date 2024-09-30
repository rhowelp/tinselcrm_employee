import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tinselcrm_employee/common/models/timein_history_model.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';
import 'package:tinselcrm_employee/common/shared_widgets/custom_button.dart';
import 'package:tinselcrm_employee/features/time_clock/time_in.dart';

class TimeClockView extends StatefulWidget {
  const TimeClockView({super.key});

  @override
  State<TimeClockView> createState() => _TimeClockViewState();
}

class _TimeClockViewState extends State<TimeClockView> {
  final timeInHistoryList = [
    TimeInHistoryModel(
      type: 'INSTALL',
      name: 'Zack Marker',
      project: '2024 Christmas Display',
      timein: DateTime.now().subtract(
        const Duration(days: 1, hours: 5, minutes: 46),
      ),
      timeout: DateTime.now().subtract(
        const Duration(days: 1, hours: 1, minutes: 21),
      ),
    ),
    TimeInHistoryModel(
      type: 'INSTALL',
      name: 'Aryhan Coyco',
      project: '2024 Christmas Display',
      timein: DateTime.now().subtract(
        const Duration(days: 2, hours: 6, minutes: 33),
      ),
      timeout: DateTime.now().subtract(
        const Duration(days: 2, hours: 1, minutes: 21),
      ),
    ),
    TimeInHistoryModel(
      type: 'INSTALL',
      name: 'Gaston Velarde',
      project: '2024 Christmas Display',
      timein: DateTime.now().subtract(
        const Duration(days: 3, hours: 4, minutes: 34),
      ),
      timeout: DateTime.now().subtract(
        const Duration(days: 3, hours: 1, minutes: 21),
      ),
    ),
    TimeInHistoryModel(
      type: 'INSTALL',
      name: 'Nemuel',
      project: '2024 Christmas Display',
      timein: DateTime.now().subtract(
        const Duration(days: 4, hours: 5, minutes: 11),
      ),
      timeout: DateTime.now().subtract(
        const Duration(days: 4, hours: 1, minutes: 13),
      ),
    ),
  ];

  String _timeString = "";
  String _dateString = "";
  late Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
  }

  init() async {
    Future.delayed(const Duration(milliseconds: 200));
    _timeString = _formatCurrentTime();
    _dateString = _formatCurrentDate();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedTime = _formatCurrentTime();
    setState(() {
      _timeString = formattedTime;
    });
  }

  String _formatCurrentTime() {
    DateTime now = DateTime.now();
    return DateFormat('hh:mm:ss a').format(now);
  }

  String _formatCurrentDate() {
    DateTime now = DateTime.now();
    return DateFormat('MMM dd, yyyy').format(now);
  }

  String _calculateTimeRange(DateTime timeIn, DateTime timeOut) {
    Duration diff = timeOut.difference(timeIn);
    String timeHour = '';
    String timeMin = '';
    if (diff.inHours > 1) {
      timeHour = "${diff.inHours} hrs";
    } else {
      timeHour = "${diff.inHours} hr";
    }

    if (diff.inMinutes > 1) {
      timeMin = "${diff.inMinutes.remainder(60)} mins";
    } else {
      timeMin = "${diff.inMinutes.remainder(60)} min";
    }

    return "$timeHour\n$timeMin";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Time Clock',
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: ColorPalette.grey.withOpacity(0.5),
                          blurRadius: 1,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _dateString,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                _timeString,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          CustomButton(
                            width: 150,
                            title: 'Time - In',
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TimeInView(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Time In History',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: timeInHistoryList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemBuilder: (context, index) {
                        final timeInHistory = timeInHistoryList[index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: ColorPalette.primaryColor.withOpacity(0.3),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      timeInHistory.type,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      timeInHistory.name,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      timeInHistory.project,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Time in: ${DateFormat("MMM dd, yyyy - hh:mm a").format(timeInHistory.timein)}',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Time out: ${DateFormat("MMM dd, yyyy - hh:mm a").format(timeInHistory.timeout)}',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: Text(
                                    _calculateTimeRange(
                                      timeInHistory.timein,
                                      timeInHistory.timeout,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
