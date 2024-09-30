import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tinselcrm_employee/features/login/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const LoginView(),
          ),
        );
      },
    );
    getFCMToken();
    super.initState();
  }

  void getFCMToken() async {
    log("FCM ${await FirebaseMessaging.instance.getToken().then((value) => value)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeInUp(
        duration: const Duration(seconds: 2),
        child: Align(
          alignment: const Alignment(0, -0.10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Image.asset('assets/tinsel_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
