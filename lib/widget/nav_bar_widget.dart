import 'package:flutter/material.dart';
import 'package:lms_app/provider/bottom_nav_provider.dart';
import 'package:lms_app/screen/home/favorite_screen.dart';
import 'package:lms_app/screen/home/home_screen.dart';
import 'package:lms_app/screen/home/learning_screen.dart';

import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavBarWidget> {
  final List<Widget> page = <Widget>[
    const HomeScreen(),
    const FavoriteScreen(),
    const LearningScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavProvider>(
        builder: (context, bottomNavProv, _) {
          return Center(
            child: page.elementAt(bottomNavProv.selectedIndex),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: Colors.deepPurple,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Consumer<BottomNavProvider>(
            builder: (context, bottomNavProv, _) {
              return GNav(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.deepPurple,
                tabBackgroundColor: Colors.deepPurple.shade800,
                gap: 15,
                color: Colors.white,
                activeColor: Colors.white,
                onTabChange: (index) => bottomNavProv.changePage(index),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Favorite',
                  ),
                  GButton(
                    icon: Icons.play_arrow,
                    text: 'Learning',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
