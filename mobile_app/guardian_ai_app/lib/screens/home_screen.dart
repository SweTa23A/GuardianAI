import 'package:flutter/material.dart';
import 'emergency_contacts_screen.dart';
import 'sos_screen.dart';
import 'sos_history_screen.dart';
import 'journey_screen.dart';
import 'journey_history_screen.dart';
import 'alert_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GuardianAI"),
        backgroundColor: Colors.purple,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmergencyContactsScreen(),
                  ),
                );
              },
              child: const Text("Emergency Contacts"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SOSScreen()),
                );
              },
              child: const Text("SOS"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JourneyScreen(),
                  ),
                );
              },
              child: const Text("Guardian Journey"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JourneyHistoryScreen(),
                  ),
                );
              },
              child: const Text("Journey History"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SOSHistoryScreen(),
                  ),
                );
              },
              child: const Text("SOS History"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(builder: (context) => const AlertScreen()),
                );
              },

              child: const Text("Safety Alerts"),
            ),
          ],
        ),
      ),
    );
  }
}
