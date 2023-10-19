import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget bottomNavigation(Function(int index) onTap, BuildContext context, int index) {
  NavigationBar navigation = NavigationBar(
    selectedIndex: index,
    onDestinationSelected: onTap,
    
    
    
    destinations: [
      NavigationDestination(icon: Icon(Icons.home_outlined), label: "Dashboard"),
     // BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Applications"),
      NavigationDestination(icon: Icon(Icons.school_outlined), label: AppLocalizations.of(context).tests),
      NavigationDestination(icon: Icon(Icons.co_present_outlined), label: AppLocalizations.of(context).interviews),
      NavigationDestination(icon: Icon(Icons.person_outline), label: AppLocalizations.of(context).profile),
      
    ]);

    return navigation;

}

Widget cardDashboard(String title, BuildContext context) {
  return Container(
    width: 250,
    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        width: 3.0,
        color: const Color.fromARGB(255, 58, 0, 229),
      )
    ),
    child: Column(
      
      children: [
        Text(
          title,
          style: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 58, 0, 229))),
              onPressed: (){},
               child: Text(AppLocalizations.of(context).details),
               ),
          ],
        )
      ],

    ),
  );
}

