import 'package:flutter/material.dart';

import '../services/journey_service.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() =>
      _JourneyScreenState();
}

class _JourneyScreenState
    extends State<JourneyScreen> {

  final destinationController =
      TextEditingController();

  final arrivalController =
      TextEditingController();

  Future<void> startJourney() async {

    await JourneyService().startJourney(

      destinationController.text,

      arrivalController.text,

    );

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content: Text(
          "Journey Started",
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Guardian Journey",
        ),
        backgroundColor: Colors.blue,
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(

              controller:
                  destinationController,

              decoration:
                  const InputDecoration(

                labelText:
                    "Destination",

              ),

            ),

            const SizedBox(
              height: 20,
            ),

            TextField(

              controller:
                  arrivalController,

              decoration:
                  const InputDecoration(

                labelText:
                    "Expected Arrival Time",

              ),

            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(

              onPressed:
                  startJourney,

              child:
                  const Text(
                "Start Journey",
              ),

            )

          ],

        ),

      ),

    );

  }

}