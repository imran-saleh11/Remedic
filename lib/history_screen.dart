import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text("History", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 24),
            _buildCalendarBar(),
            const SizedBox(height: 40),
            const Text('COMPLETED ACTIVITIES', style: TextStyle(fontSize: 10, letterSpacing: 2, color: Colors.grey)),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Padding(padding: EdgeInsets.only(top: 8), child: CircleAvatar(radius: 3, backgroundColor: Colors.grey)),
                  title: const Text('Medicine Taken', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Wednesday, 12 Oct · 08:00 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: const Icon(Icons.check_circle_outline, color: Colors.grey, size: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarBar() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          bool isSelected = index == 2;
          return Container(
            width: 50,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFF5F5F5) : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[900]!),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(['M', 'T', 'W', 'T', 'F', 'S', 'S'][index], style: TextStyle(fontSize: 10, color: isSelected ? Colors.black : Colors.grey)),
                Text('${12 + index}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isSelected ? Colors.black : Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}