import 'package:flutter/material.dart';

Widget searchTextFormField({onChanged, controller}) {
  return Expanded(
    child: TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search...',
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 199, 51, 142)),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 199, 51, 142)),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIcon: const Icon(Icons.search),
      ),
    ),
  );
}

// Widget cartIconContainer({Function()? onPressed}) {
//   return Container(
//     height: 46,
//     width: 46,
//     decoration: const BoxDecoration(
//       color: Color(0xFF202020),
//       shape: BoxShape.circle,
//       boxShadow: [
//         BoxShadow(color: Colors.grey, blurRadius: 5),
//       ],
//     ),
//     padding: const EdgeInsets.all(4),
//     child: IconButton(
//       onPressed: onPressed,
//       icon: const Icon(Icons.shopping_cart_outlined),
//     ),
//   );
// }

SliverGridDelegateWithFixedCrossAxisCount gridDelegate(childAspectRatio) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: childAspectRatio,
  );
}