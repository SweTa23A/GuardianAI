import 'dart:convert';
import 'package:http/http.dart' as http;

class JourneyService {
  Future<void> startJourney(String destination, String arrivalTime) async {
    await http.post(
      Uri.parse("http://localhost:5000/api/journey/start"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({
        "email": "riya@gmail.com",

        "destination": destination,

        "expectedArrivalTime": arrivalTime,
      }),
    );
  }

  Future<List<dynamic>> getJourneyHistory() async {
    final response = await http.post(
      Uri.parse("http://localhost:5000/api/journey/history"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"email": "riya@gmail.com"}),
    );

    final data = jsonDecode(response.body);

    return data["journeys"];
  }

  Future<void> completeJourney(String journeyId) async {
    await http.post(
      Uri.parse("http://localhost:5000/api/journey/complete"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"journeyId": journeyId}),
    );
  }
}
