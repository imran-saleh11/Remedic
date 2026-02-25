import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 24),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),

          _sectionHeader("PREFERENCES"),
          _buildSwitchTile(
              Icons.notifications_none,
              "Push Notifications",
              _notifications,
                  (val) => setState(() => _notifications = val)
          ),
          _buildSwitchTile(
              Icons.dark_mode_outlined,
              "Dark Mode",
              _darkMode,
                  (val) => setState(() => _darkMode = val)
          ),

          const SizedBox(height: 32),
          _sectionHeader("APP INFO"),
          _buildLinkTile(Icons.info_outline, "About Remedic", ""),
          _buildLinkTile(Icons.description_outlined, "Privacy Policy", ""),
          _buildLinkTile(Icons.help_outline, "Support Center", ""),

          const SizedBox(height: 32),
          _sectionHeader("DANGER ZONE"),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
            title: const Text("Delete Account", style: TextStyle(color: Colors.redAccent)),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 10,
          letterSpacing: 2,
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value, Function(bool) onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white),
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFF5F5F5),
        activeTrackColor: Colors.grey[800],
      ),
    );
  }

  Widget _buildLinkTile(IconData icon, String title, String trailingText) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText.isNotEmpty)
            Text(trailingText, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
        ],
      ),
      onTap: () {},
    );
  }
}