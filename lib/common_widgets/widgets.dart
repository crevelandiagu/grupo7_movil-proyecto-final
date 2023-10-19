import 'package:flutter/material.dart';

Widget bottomNavigation(Function(int index) onTap) {
  NavigationBar navigation = NavigationBar(
    selectedIndex: 0,
    onDestinationSelected: onTap,
    
    
    
    destinations: const [
      NavigationDestination(icon: Icon(Icons.home_outlined), label: "Dashboard"),
     // BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Applications"),
      NavigationDestination(icon: Icon(Icons.school_outlined), label: "Tests"),
      NavigationDestination(icon: Icon(Icons.co_present_outlined), label: "Interviews"),
      NavigationDestination(icon: Icon(Icons.person_outline), label: "Profile"),
      
    ]);

    return navigation;

}

Widget cardDashboard(String title) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: Colors.blue
      )
    ),
    child: Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: (){},
               child: const Text('Details'))
          ],
        )
      ],

    ),
  );
}

