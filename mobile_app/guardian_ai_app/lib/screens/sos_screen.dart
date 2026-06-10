import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class SOSScreen extends StatelessWidget {
  const SOSScreen({super.key});

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location disabled");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> sendSOS(BuildContext context) async {
    try {
      final position = await getLocation();

      final response = await http.post(
        Uri.parse("http://localhost:5000/api/sos/send"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({
          "email": "riya@gmail.com",

          "latitude": position.latitude,

          "longitude": position.longitude,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("SOS Sent Successfully")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SOS"), backgroundColor: Colors.red),

      body: Center(
        child: GestureDetector(
          onTap: () {
            sendSOS(context);
          },

          child: Container(
            width: 220,
            height: 220,

            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),

            child: const Center(
              child: Text(
                "SOS",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
