import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;
  const SplashScreen({super.key, required this.onFinished});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // start fade
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _visible = true;
      });
    });

    // finish splash
    Timer(const Duration(seconds: 4), widget.onFinished);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                child: Image.asset(
                  'assets/logo.jpg',
                  width: 280,
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Text(
                'Remedic',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}