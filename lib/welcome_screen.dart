import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsetsGeometry.directional(top: 20),
              child: Image.asset("assets/welcome.png")
            ),
            Container(
              margin: EdgeInsetsGeometry.directional(
                top: 28,
                bottom: 32
              ),
              child: Text(
                "Welcome to\nRemedic",
                style: TextStyle(
                  fontSize: 42,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsetsGeometry.directional(
                start: 20,
                end: 20,
                bottom: 120,
              ),
              child: Text(
                "Stay on track with your medications, every day. Remedic reminds you when it’s time for your medicine, keeps track of your supplies, and helps you manage your complete medical history — all in one place.",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 320,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  SizedBox(
                    width: 320,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0x66666666),
                        foregroundColor: Color(0xEFEFEFEF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 16),
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