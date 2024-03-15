// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:ecommerce_app/controller/bottom_provider.dart';
import 'package:ecommerce_app/welcome/login_screen.dart';
import 'package:ecommerce_app/widget/settings_widget_page.dart';
import 'package:ecommerce_app/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 245, 245),
          title: textAbel(data: 'SETTINGS', size: 20, weight: FontWeight.bold)),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.grey),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/pfofile-avatar.png'),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "AKHSA",
                      ),
                      Text(
                        "akhsa@gmail.com",
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            settingPageCard('ABOUT', Icons.info),
            settingPageCard('PRIVACY AND POLICY', Icons.privacy_tip_outlined),
            InkWell(
                onTap: () async {
                  final data = await SharedPreferences.getInstance();
                  data.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                      Provider.of<BottomProvider>(context,listen: false).myIndex=0;
                },
                child: settingPageCard('LOG OUT', Icons.logout_outlined))
          ],
        ),
      ),
    );
  }
}
