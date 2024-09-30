import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:tinselcrm_employee/common/shared_widgets/color.dart';
import 'package:tinselcrm_employee/common/shared_widgets/custom_button.dart';

class TimeInView extends StatefulWidget {
  const TimeInView({super.key});

  @override
  State<TimeInView> createState() => _TimeInViewState();
}

class _TimeInViewState extends State<TimeInView> {
  String? selectedManager = '';
  String? selectedProject = '';
  String? selectedType = '';
  final clientList = [
    'Alessia Christensen',
    'Gregory Daniels',
    'Ember Arroyo',
    'Alberto Curtis',
  ];

  final projectList = [
    '2024 Christmas Display',
    'Inventory Prep',
    'Stock Level'
  ];

  final typeList = [
    'Prep - In Warehouse',
    'Prep - Out Warehouse',
    'Installation',
    'Maintenance',
    'Removal',
    'Post Removal',
    'Transportation',
  ];

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(70),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.chevron_left_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(20),
                      const Text(
                        'Time In',
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
                  Text(
                    'Client',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 3, bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorPalette.grey.withOpacity(.6),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: ColorPalette.white,
                    ),
                    child: DropdownButton<String>(
                      value: selectedManager != '' ? selectedManager : null,
                      menuMaxHeight: 350,
                      hint: Text(
                        'Select Client',
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorPalette.grey,
                        ),
                      ),
                      isExpanded: true,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      underline: Container(color: Colors.transparent),
                      dropdownColor: Colors.white,
                      icon: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right,
                          color: ColorPalette.grey,
                        ),
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black),
                      items: clientList.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (selectedValue) {
                        setState(() {
                          selectedManager = selectedValue;
                        });
                      },
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Project',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 3, bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorPalette.grey.withOpacity(.6),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: ColorPalette.white,
                    ),
                    child: DropdownButton<String>(
                      value: selectedProject != '' ? selectedProject : null,
                      menuMaxHeight: 350,
                      hint: Text(
                        'Select Project',
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorPalette.grey,
                        ),
                      ),
                      isExpanded: true,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      underline: Container(color: Colors.transparent),
                      dropdownColor: Colors.white,
                      icon: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right,
                          color: ColorPalette.grey,
                        ),
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black),
                      items: projectList.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (selectedValue) {
                        setState(() {
                          selectedProject = selectedValue;
                        });
                      },
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Type',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 3, bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorPalette.grey.withOpacity(.6),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: ColorPalette.white,
                    ),
                    child: DropdownButton<String>(
                      value: selectedType != '' ? selectedType : null,
                      menuMaxHeight: 350,
                      hint: Text(
                        'Select Type',
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorPalette.grey,
                        ),
                      ),
                      isExpanded: true,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      underline: Container(color: Colors.transparent),
                      dropdownColor: Colors.white,
                      icon: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right,
                          color: ColorPalette.grey,
                        ),
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black),
                      items: typeList.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (selectedValue) {
                        setState(() {
                          selectedType = selectedValue;
                        });
                      },
                    ),
                  ),
                  const Gap(40),
                  CustomButton(
                    title: 'Time In',
                    onPressed: () {
                      Navigator.pop(context);
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.success(
                          message: "You have successfully clocked in.",
                        ),
                      );
                    },
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
