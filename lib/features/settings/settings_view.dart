import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';
import 'package:tinselcrm_employee/features/settings/change_password_view.dart';

class UserSettingsView extends StatelessWidget {
  const UserSettingsView({super.key});

  Widget userProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Hero(
            tag: 'imageUser',
            child: Material(
              elevation: 1,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/user_photo.png'),
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'John Mark Dela Cruz',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'jmdelacruz@gmail.com',
                style: TextStyle(
                  fontSize: 12,
                  color: ColorPalette.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget settingItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            child: ListTile(
              title: const Text('Profile'),
              leading: const Icon(
                Icons.account_circle_outlined,
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: ColorPalette.grey,
              ),
              onTap: () {},
            ),
          ),
          const Gap(10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangePasswordView(),
                ),
              );
            },
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: ListTile(
                title: const Text('Change Password'),
                leading: const Icon(
                  Icons.lock_open_outlined,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: ColorPalette.grey,
                ),
              ),
            ),
          ),
          const Gap(30),
          GestureDetector(
            onTap: () {},
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: ListTile(
                title: const Text('Logout'),
                leading: const Icon(
                  Icons.logout_outlined,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: ColorPalette.grey,
                ),
              ),
            ),
          ),
          const Gap(24),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: SingleChildScrollView(
        child: Column(
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
                          'Settings',
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
            userProfile(context),
            settingItems(context),
          ],
        ),
      ),
    );
  }
}
