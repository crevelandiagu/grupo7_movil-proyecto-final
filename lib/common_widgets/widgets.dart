import 'package:flutter/material.dart';

Widget bottomNavigation(int index, Function(int index) onTap) {
  BottomNavigationBar navigation = BottomNavigationBar(
    currentIndex: index,
    onTap: onTap,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
      BottomNavigationBarItem(icon: Icon(Icons.work), label: "Applications"),
      BottomNavigationBarItem(icon: Icon(Icons.psychology_outlined), label: "Tests"),
      BottomNavigationBarItem(icon: Icon(Icons.co_present), label: "Interviews"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      
    ]);

    return navigation;

}