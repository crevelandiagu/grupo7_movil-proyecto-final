import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';

class WorkInfo extends StatelessWidget {
  WorkInfo({super.key});

  var currentValue = "Tipo Trabajo 1".obs;

  final  items = [
    "Tipo Trabajo 1",
    "Tipo Trabajo 2",
    "Tipo Trabajo 3",
    "Tipo Trabajo 4",
    "Tipo Trabajo 5",
    "Tipo Trbajo 6",
    "Tipo Trabajo 7"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: SingleChildScrollView(
        child: Obx(()=>Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
              child: TextField(
                key: const Key('textPosition'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).name,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).nameLabel,
                ),
              ),
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DropdownButtonFormField(
                icon: Icon(Icons.keyboard_arrow_down),
                

                value: currentValue.value,

                items: items.map((String item){
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item)
                        ); 
                      }).toList(),
                onChanged: (String? value){
                  currentValue.value = value as String;

                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).employmentType,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                ),

                
              ),

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
              child: TextField(
                key: const Key('company'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).companyName,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).companyLabel,
                ),
              ),
              ),

              const SizedBox(
                height: 18,),
            
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2100),
                        dateLabelText: 'start date',                  
                      ),
                    ),
                  ),
                //  SizedBox(width: 10,),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2100),
                        dateLabelText: 'end date',                   
                      ),
                    ),
                  ),
                ],
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
              child: TextField(
                key: const Key('phone'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).phoneNumber,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).phoneLabel,
                ),
              ),
              ),

             const  SizedBox(
                height: 20,
              ),

                ElevatedButton(
                key: const Key('nextButton'),
                style: ElevatedButton.styleFrom(
                 // minimumSize: const Size.fromHeight(50),
                 backgroundColor: Color.fromARGB(255, 58, 0, 229),
                ),
                onPressed: (){},
                child: Text('Next', style: GoogleFonts.workSans(
                  textStyle: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ),

              ),
              



            


        
            

          ],
        ),
        ),
      ),    
    );
  }
}