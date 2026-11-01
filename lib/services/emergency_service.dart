import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyService {
  // Functional: Make phone call using url_launcher
  static Future<void> makePhoneCall(BuildContext context, String number) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: number,
    );

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cannot open phone dialer for $number'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to make the emergency call.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // Simulated GPS Location request helper
  static Future<Map<String, String>> getSimulatedLocation() async {
    // Simulating GPS acquisition delay
    await Future.delayed(const Duration(seconds: 1));
    return {
      'latitude': '28.6139° N',
      'longitude': '77.2090° E',
      'address': 'Connaught Place, New Delhi (Simulated GPS)',
    };
  }
}
