import 'package:flutter/material.dart';
import '../widgets/contact_card.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF7B1FA2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Trusted Emergency Circle',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Tap call to immediately reach authorities or help numbers.',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 20),

          const ContactCard(
            name: 'Emergency Services (National)',
            number: '112',
            icon: Icons.local_police_rounded,
          ),
          const ContactCard(
            name: 'Women Helpline',
            number: '181',
            icon: Icons.support_agent_rounded,
          ),
          const ContactCard(
            name: 'Police Control Room',
            number: '100',
            icon: Icons.local_police,
          ),
          const ContactCard(
            name: 'Ambulance & Medical',
            number: '102',
            icon: Icons.medical_services_rounded,
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 54,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B1FA2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Add custom contact feature is active.'),
                  ),
                );
              },
              icon: const Icon(Icons.person_add_rounded),
              label: const Text(
                'ADD EMERGENCY CONTACT',
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
