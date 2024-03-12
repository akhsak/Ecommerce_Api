// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable
import 'package:ecommerce_app/controller/bottom_provider.dart';
import 'package:ecommerce_app/view/home_page.dart';
import 'package:ecommerce_app/view/settings_page.dart';
import 'package:ecommerce_app/view/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatelessWidget {
  Bottombar({
    super.key,
  });

  List pages = [
    HomePage(),
    WishListPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<BottomProvider>(
          builder: (context, value, child) => pages[value.myIndex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(22.10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Consumer<BottomProvider>(
              builder: (context, value, child) => BottomNavigationBar(
                unselectedFontSize: 0,
                type: BottomNavigationBarType.fixed,
                onTap: value.onTap,
                backgroundColor: const Color.fromARGB(24, 7, 100, 95),
                currentIndex: value.myIndex,
                selectedItemColor: const Color.fromARGB(255, 9, 49, 83),
                unselectedItemColor: const Color.fromARGB(255, 145, 176, 239),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 25,
                    ),
                    label: 'ᴴᵒᵐᵉ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      size: 25,
                    ),
                    label: 'ʷᶦˢʰˡᶦˢᵗ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 25,
                    ),
                    label: 'ˢᵉᵗᵗᶦⁿᵍˢ',
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
            top: 25,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
