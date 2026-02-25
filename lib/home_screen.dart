import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onTriggerAlarm;
  const HomeScreen({super.key, required this.onTriggerAlarm});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reminders = [
      {'id': 1, 'name': 'Amoxicillin', 'dose': '500mg', 'time': '08:00 AM', 'status': 'taken'},
      {'id': 2, 'name': 'Vitamin D', 'dose': '1000IU', 'time': '12:00 PM', 'status': 'pending'},
      {'id': 3, 'name': 'Lisinopril', 'dose': '10mg', 'time': '08:00 PM', 'status': 'pending'},
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          _buildHeader("Dashboard"),
          const SizedBox(height: 24),
          _buildNextDoseCard(),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Today\'s Schedule', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('See all', style: TextStyle(color: Colors.grey[600], decoration: TextDecoration.underline)),
            ],
          ),
          const SizedBox(height: 24),
          ...reminders.map((med) => _buildMedicineCard(med)),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -1)),
          const CircleAvatar(
            backgroundColor: Color(0xFF121212),
            child: Icon(Icons.notifications_none, size: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildNextDoseCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey[900]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Next Dose In', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
          const Text('45m 12s', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 8),
              Text('Vitamin D · 12:00 PM'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard(Map<String, dynamic> med) {
    bool isTaken = med['status'] == 'taken';
    return GestureDetector(
      onTap: () { if (!isTaken) onTriggerAlarm(); },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isTaken ? const Color(0xFF121212) : Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[900]!),
        ),
        child: Opacity(
          opacity: isTaken ? 0.5 : 1.0,
          child: Row(
            children: [
              Container(
                width: 50, height: 50,
                decoration: BoxDecoration(
                  color: isTaken ? Colors.black : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.add_box_outlined, color: isTaken ? Colors.grey[700] : Colors.black),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(med['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${med['dose']} · ${med['time']}', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
                  ],
                ),
              ),
              isTaken
                  ? const Icon(Icons.check_circle, color: Colors.grey)
                  : Container(width: 24, height: 24, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey[800]!, width: 2))),
            ],
          ),
        ),
      ),
    );
  }
}