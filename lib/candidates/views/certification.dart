import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Certification extends StatelessWidget {
  const Certification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(30),
          itemCount: 2,
          itemBuilder: (context, index){
            return Card(
                  
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        Text('Certification'),
                        ListTile(        
                          minVerticalPadding: 0,                  
                          title: Text('CGP professional'),
                          subtitle: Text("january 2021"),                 
                        ),
                    ],
                  )
            );
          }
          ),
      )
      );

  }
}