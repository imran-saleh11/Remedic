import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  final VoidCallback onClose;
  const AlarmScreen({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 80, height: 80,
                    decoration: BoxDecoration(color: const Color(0xFF121212), shape: BoxShape.circle, border: Border.all(color: Colors.grey[900]!)),
                    child: const Icon(Icons.notifications_active, size: 40),
                  ),
                  const SizedBox(height: 40),
                  Text('Time to take', style: TextStyle(fontSize: 20, color: Colors.grey[400], fontWeight: FontWeight.w300)),
                  const Text('Vitamin D', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                  const Text('1000 IU · 12:00 PM', style: TextStyle(fontSize: 20, color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity, height: 80,
                    child: ElevatedButton(
                      onPressed: onClose,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF5F5F5),
                        foregroundColor: Colors.black,
                        shape: const StadiumBorder(),
                        elevation: 20, shadowColor: Colors.white24,
                      ),
                      child: const Text('I TOOK IT', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: OutlinedButton(onPressed: onClose, style: OutlinedButton.styleFrom(minimumSize: const Size(0, 60), shape: const StadiumBorder()), child: const Text('SNOOZE', style: TextStyle(color: Colors.grey)))),
                      const SizedBox(width: 16),
                      Expanded(child: OutlinedButton(onPressed: onClose, style: OutlinedButton.styleFrom(minimumSize: const Size(0, 60), shape: const StadiumBorder()), child: const Text('SKIP', style: TextStyle(color: Colors.grey)))),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}