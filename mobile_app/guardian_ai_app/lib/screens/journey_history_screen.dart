import 'package:flutter/material.dart';

import '../services/journey_service.dart';

class JourneyHistoryScreen extends StatefulWidget {
  const JourneyHistoryScreen({super.key});

  @override
  State<JourneyHistoryScreen> createState() => _JourneyHistoryScreenState();
}

class _JourneyHistoryScreenState extends State<JourneyHistoryScreen> {
  List journeys = [];

  @override
  void initState() {
    super.initState();

    loadJourneys();
  }

  Future<void> loadJourneys() async {
    final data = await JourneyService().getJourneyHistory();

    setState(() {
      journeys = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journey History"),

        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        itemCount: journeys.length,

        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.route),

            title: Text(journeys[index]["destination"]),

            subtitle: Text(
              "Arrival: ${journeys[index]["expectedArrivalTime"]}",
            ),

            trailing: journeys[index]["status"] == "ACTIVE"
                ? ElevatedButton(
                    onPressed: () async {
                      await JourneyService().completeJourney(
                        journeys[index]["_id"],
                      );

                      loadJourneys();
                    },

                    child: const Text("Mark Safe"),
                  )
                : const Text("COMPLETED"),
          );
        },
      ),
    );
  }
}
