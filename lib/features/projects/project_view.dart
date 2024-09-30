import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tinselcrm_employee/common/models/projects_model.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';
import 'package:tinselcrm_employee/common/shared_widgets/custom_textfield.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  final List<ProjectsModel> projectsList = [
    ProjectsModel(
      project: "2025 Christmas Lights",
      client: "A C",
      site: "15558 S Springwater Rd (Residence)",
      category: "Christmas",
      storageLocation: "",
      stage: "Proposal",
      status: "In Progress",
      updated: DateTime.parse("2024-09-12 05:16:00"),
    ),
    ProjectsModel(
      project: "2024 Christmas Display",
      client: "A C",
      site: "15558 S Springwater Rd (Residence)",
      category: "Christmas",
      storageLocation: "Row 07 - Shelf B - 3 Boxes",
      stage: "Reviews",
      status: "In Progress",
      updated: DateTime.parse("2024-09-12 05:15:00"),
    ),
    ProjectsModel(
      project: "Testing Proposal Trimmer",
      client: "A C",
      site: "15558 S Springwater Rd (Residence)",
      category: "Christmas",
      storageLocation: "",
      stage: "Proposal",
      status: "In Progress",
      updated: DateTime.parse("2024-09-11 02:59:00"),
    ),
    ProjectsModel(
      project: "2025 Christmas Lights",
      client: "A C",
      site: "15558 S Springwater Rd (Residence)",
      category: "Christmas",
      storageLocation: "",
      stage: "Project Prep",
      status: "In Progress",
      updated: DateTime.parse("2024-09-11 01:24:00"),
    ),
    ProjectsModel(
      project: "2025 Christmas Lights",
      client: "Abbi Hayball",
      site: "35911 Browning Park (Homee)",
      category: "Christmas",
      storageLocation: "Row 07 - Shelf B - 3 Boxes",
      stage: "Reviews",
      status: "In Progress",
      updated: DateTime.parse("2024-09-04 03:05:00"),
    ),
    ProjectsModel(
      project: "Nem test cloning",
      client: "A C",
      site: "15558 S Springwater Rd (Residence)",
      category: "Christmas",
      storageLocation: "",
      stage: "Proposal",
      status: "In Progress",
      updated: DateTime.parse("2024-08-26 21:39:00"),
    ),
  ];
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
                        'Projects',
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
                  CustomTextFormField(
                    hintText: 'Search...',
                  ),
                  const Gap(20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: projectsList.length,
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemBuilder: (context, index) {
                        final project = projectsList[index];
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
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.project,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  project.client,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  project.site,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                if (project.storageLocation != "")
                                  Text(
                                    project.storageLocation,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Category: ',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: project.category,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Stage: ',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: project.stage,
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  DateFormat('MMM dd, yyyy - hh:mm a')
                                      .format(project.updated),
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ColorPalette.greyText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
