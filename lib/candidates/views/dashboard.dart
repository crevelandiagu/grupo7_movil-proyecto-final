import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.language),
            ),
          IconButton(
            onPressed: (){},
             icon: const Icon(Icons.notifications),
             ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.account_circle),
            ),
        ],
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              
              const SizedBox(
                height: 40,
              ),
                  Column(
                  children: [
                   const Text('Hola, Nombre',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),

                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    
                  
                    cardDashboard(AppLocalizations.of(context)!.applications, context),
                    SizedBox(height: 40,),
                    cardDashboard(AppLocalizations.of(context)!.interviews, context),
                    SizedBox(height: 40,),
                    cardDashboard(AppLocalizations.of(context)!.tests, context),
                  ],
                ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
    );
  }
}