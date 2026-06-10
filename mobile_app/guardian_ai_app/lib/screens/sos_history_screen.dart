import 'package:flutter/material.dart';
import '../services/sos_service.dart';

class SOSHistoryScreen extends StatefulWidget {
  const SOSHistoryScreen({super.key});

  @override
  State<SOSHistoryScreen> createState() =>
      _SOSHistoryScreenState();
}

class _SOSHistoryScreenState
    extends State<SOSHistoryScreen> {

  List history = [];

  @override
  void initState() {
    super.initState();

    loadHistory();
  }

  Future<void> loadHistory() async {

    final data =
        await SOSService().getSOSHistory();

    setState(() {
      history = data;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "SOS History",
        ),
        backgroundColor: Colors.red,
      ),

      body: ListView.builder(

        itemCount: history.length,

        itemBuilder: (context, index) {

          return ListTile(

            leading: const Icon(
              Icons.warning,
              color: Colors.red,
            ),

            title: Text(
              history[index]["message"],
            ),

            subtitle: Text(
              history[index]["createdAt"],
            ),

          );

        },

      ),

    );

  }
}