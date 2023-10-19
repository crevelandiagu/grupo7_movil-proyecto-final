import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Container(
                padding: EdgeInsets.only(top: 10),
                width: 180,
                height: 180,
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('Image'),
                  ),
              ),
              const SizedBox(
                height: 40,
              ),
                  Column(
                  children: [
                   const Text('Nombre',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, color: Colors.blue,),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Location', style: TextStyle(fontSize: 16),),                       
                      ],
                    ),
                      const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.phone, color: Colors.blue,),
                        SizedBox(width: 5,),
                        Text('phone number',
                        style: TextStyle( fontSize: 16),),
                      ],
                    ),
                      const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.mail, color: Colors.blue,),
                        SizedBox(width: 5,),
                        Text('email@email.com', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                   const SizedBox(
                      height: 10,
                    ),

                    cardDashboard("Applications"),
                    SizedBox(height: 10,),
                    cardDashboard("Interviews"),
                    SizedBox(height: 10,),
                    cardDashboard("Tests"),
                  ],
                ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation((index) => null),
    );
  }
}