import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool? obscureText;
  final type;
  final TextEditingController controller;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.obscureText,
      this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
         validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter $labelText";
          } else if (type == "Email") {
            if (!EmailValidator.validate(value)) {
              return "Please enter a valid email address";
            }
          } else if (type == 'Password') {
            if (value.length < 5) {
              return 'Password should be at least 6 characters';
            }
          }
          return null;
        },
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 199, 51, 142)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:Color.fromARGB(255, 199, 51, 142)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 199, 51, 142)),
        ),
      ),
    );
  }
}