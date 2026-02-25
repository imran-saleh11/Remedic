import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onLogout;
  const ProfileScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 120, height: 120,
                  decoration: BoxDecoration(color: const Color(0xFF121212), shape: BoxShape.circle, border: Border.all(color: Colors.grey[900]!, width: 4)),
                  child: const Center(child: Text('BRS', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
                ),
                Positioned(bottom: 0, right: 0, child: Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(color: Color(0xFFF5F5F5), shape: BoxShape.circle), child: const Icon(Icons.camera_alt, color: Colors.black, size: 20))),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('B.M. Raihan Saleh', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('rainhan_saleh@remedic.health', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 40),
          _item(Icons.person_outline, "Edit Profile"),
          _item(Icons.notifications_none, "Notifications"),
          _item(Icons.history, "Health Records"),
          _item(Icons.security, "Security"),
          const Spacer(),
          ListTile(onTap: onLogout, leading: const Icon(Icons.logout, color: Colors.redAccent), title: const Text('Logout', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold))),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String label) => ListTile(leading: Icon(icon, color: Colors.grey), title: Text(label), trailing: const Icon(Icons.chevron_right, size: 16, color: Colors.grey));
}