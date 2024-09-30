import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinselcrm_employee/common/shared_widgets/custom_button.dart';
import 'package:tinselcrm_employee/common/shared_widgets/custom_textfield.dart';
import 'package:tinselcrm_employee/features/homepage/homepage.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  'assets/cover_tinsel.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Image.asset(
                      'assets/tinsel_logo.png',
                      height: 300,
                      width: 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.65,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Text(
                    'Welcome',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Login with your account to continue',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Email',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Email',
                  ),
                  const Gap(20),
                  Text(
                    'Password',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const Gap(20),
                  CustomButton(
                    title: 'Login',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      );
                    },
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
