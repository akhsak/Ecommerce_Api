
// // ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors

// import 'dart:async';

// import 'package:ecommerce_app/welcome/login_screen.dart';
// import 'package:ecommerce_app/widget/bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     log();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Lottie.asset(
//           'assets/dctrrrr.json',
//           height: 300,
//         ),
//       ),
//     );
//   }

//   Future<void> login() async {
//     await Future.delayed(const Duration(seconds: 3));
//     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
//       return ScreenLogin();
//     }));
//   }

//   Future<void> log() async {
//     final sharedperfer = await SharedPreferences.getInstance();

//     final userLog = sharedperfer.getBool(
//       savekeyname
//       );
//     if (userLog == null || userLog == false) {
//       login();
//     } else {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => Bottombar()
//         )
//          );
//     }
//   }
// }
// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors

import 'dart:async';

import 'package:ecommerce_app/welcome/login_screen.dart';
import 'package:ecommerce_app/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    log();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/Animation -splash screen.json',
          height: 300,
        ),
      ),
    );
  }

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenLogin();
    }));
  }

  Future<void> log() async {
    final sharedperfer = await SharedPreferences.getInstance();

    final userLog = sharedperfer.getBool('your_actual_key_name_here'); // Replace with the actual key name
    if (userLog == null || userLog == false) {
      login();
    } else {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => Bottombar()),
      );
    }
  }
}
