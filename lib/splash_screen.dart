import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  'Remedic',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 60),

                _buildButton(
                  context,
                  label: "Welcome Screen",
                  route: "/welcome",
                ),

                const SizedBox(height: 16),

                _buildButton(
                  context,
                  label: "Register",
                  route: "/register",
                ),

                const SizedBox(height: 16),

                _buildButton(
                  context,
                  label: "Login",
                  route: "/login",
                ),

                const SizedBox(height: 16),

                _buildButton(
                  context,
                  label: "Enter App",
                  route: "/app",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, {
        required String label,
        required String route,
      }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF5F5F5),
          foregroundColor: Colors.black,
        ),
        child: Text(label),
      ),
    );
  }
}