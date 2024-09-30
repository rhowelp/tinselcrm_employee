import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';
import 'package:tinselcrm_employee/common/shared_widgets/custom_button.dart';
import 'package:tinselcrm_employee/common/shared_widgets/custom_textfield.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                            'Change Password',
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CustomTextFormField(
                          controller: newPassword,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          isPassword: true,
                          hintText: 'Current password',
                          validator: (value) {
                            final alphanumeric = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');

                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (!alphanumeric.hasMatch(value)) {
                              return 'Invalid password';
                            }
                            return null;
                          },
                        ),
                        const Gap(20),
                        Text(
                          'New Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CustomTextFormField(
                          controller: newPassword,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          isPassword: true,
                          hintText: 'New password',
                          validator: (value) {
                            final alphanumeric = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$');

                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (!alphanumeric.hasMatch(value)) {
                              return 'Invalid password';
                            }
                            return null;
                          },
                        ),
                        const Gap(20),
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CustomTextFormField(
                          controller: confirmPassword,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: false,
                          isPassword: true,
                          hintText: 'Confirm password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (value != newPassword.text) {
                              return 'Password not match';
                            }
                            return null;
                          },
                        ),
                        const Gap(50),
                        CustomButton(
                          title: 'Change Password',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
