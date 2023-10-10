import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"), 
        centerTitle: true,     
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Text(
                  "Welcome",
                  style: GoogleFonts.workSans(
                    textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.0),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
              ),
              ),

            // TextField username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: "username",
                  hintText: "Enter valid username",
                ),
              ),
              ),

            // TextField password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: "password",
                  hintText: "Enter secure password",
                ),
              ),
              ),
            
            //Signin button
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 90, 15, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: null,
                child: Text(
                  "Sign in",
                  style: GoogleFonts.workSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.2
                    ),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                  ),
              ),
              ),
            
            //sign up text
            SizedBox(
              //height: 50.0,              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet?"),
                  TextButton(
                    onPressed: null,
                     child: Text(
                      "Sign up",
                      style: GoogleFonts.workSans(
                        textStyle: const TextStyle(
                          color: Colors.blueAccent,
                          letterSpacing: 0.2
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                     ),
                     ),                  
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}