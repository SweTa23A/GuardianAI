import 'package:flutter/material.dart';

import '../services/alert_service.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  List alerts = [];

  @override
  void initState() {
    super.initState();

    loadAlerts();
  }

  Future<void> loadAlerts() async {
    final data = await AlertService().getAlerts();

    setState(() {
      alerts = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Safety Alerts"),

        backgroundColor: Colors.red,
      ),

      body: ListView.builder(
        itemCount: alerts.length,

        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),

            title: Text(alerts[index]["message"]),

            subtitle: Text(alerts[index]["createdAt"]),
          );
        },
      ),
    );
  }
}
