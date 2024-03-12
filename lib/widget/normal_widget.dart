import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void clearControllers(UserProvider controller) {
  controller.usernameController.clear();
  controller.emailController.clear();
  controller.passwordController.clear();
}

Widget productDescDetails({String? hint, String? value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        hint!,
        style: GoogleFonts.abel(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      Text(
        value!,
        style: GoogleFonts.abel(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color:Color.fromARGB(255, 199, 51, 142),
            letterSpacing: 1),
      ),
    ],
  );
}

Widget productsDetails({String? hint, String? value}) {
  return Row(
    children: [
      Text(
        hint!,
        style: GoogleFonts.abel(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      Text(
        value!,
        style: GoogleFonts.abel(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 199, 51, 142),
            letterSpacing: 1),
      ),
    ],
  );
}