import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'welcome_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthService _authService = AuthService();
  bool _notificationsEnabled = true;
  bool _locationSharingEnabled = false;

  void _logout() {
    final navigator = Navigator.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Sign Out', style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text('Are you sure you want to sign out from She Shield?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B1FA2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () async {
                Navigator.pop(dialogContext);
                await _authService.signOut();
                if (!mounted) return;
                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  (route) => false,
                );
              },
              child: const Text('Sign Out', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF7B1FA2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Safety Preferences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFEDE7F6)),
            ),
            child: SwitchListTile(
              value: _notificationsEnabled,
              onChanged: (val) => setState(() => _notificationsEnabled = val),
              title: const Text('Safety Alerts', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Receive emergency push notifications & alerts'),
              secondary: const Icon(Icons.notifications_rounded, color: Color(0xFF7B1FA2)),
              activeThumbColor: const Color(0xFF7B1FA2),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFEDE7F6)),
            ),
            child: SwitchListTile(
              value: _locationSharingEnabled,
              onChanged: (val) => setState(() => _locationSharingEnabled = val),
              title: const Text('Live Location Sharing', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Allow constant GPS relay with emergency contacts'),
              secondary: const Icon(Icons.share_location_rounded, color: Color(0xFF7B1FA2)),
              activeThumbColor: const Color(0xFF7B1FA2),
            ),
          ),
          const SizedBox(height: 25),

          const Text(
            'Account & Session',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),

          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withValues(alpha: 0.1),
                foregroundColor: Colors.red,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.red.withValues(alpha: 0.3)),
                ),
              ),
              onPressed: _logout,
              icon: const Icon(Icons.logout_rounded),
              label: const Text(
                'SIGN OUT',
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
            ),
          ),
          const SizedBox(height: 25),

          const Text(
            'About App',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFEDE7F6)),
            ),
            child: const ListTile(
              leading: Icon(Icons.shield_rounded, color: Color(0xFF7B1FA2)),
              title: Text('She Shield', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Women Safety & Emergency Assistance'),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFEDE7F6)),
            ),
            child: const ListTile(
              leading: Icon(Icons.info_outline_rounded, color: Color(0xFF7B1FA2)),
              title: Text('Version', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('2.0.0 (Professional Edition)'),
            ),
          ),
        ],
      ),
    );
  }
}
