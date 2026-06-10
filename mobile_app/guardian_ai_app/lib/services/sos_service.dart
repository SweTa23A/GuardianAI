import 'dart:convert';
import 'package:http/http.dart' as http;

class SOSService {

  Future<List<dynamic>> getSOSHistory() async {

    final response = await http.post(

      Uri.parse(
        "http://localhost:5000/api/sos/history",
      ),

      headers: {
        "Content-Type": "application/json"
      },

      body: jsonEncode({

        "email": "riya@gmail.com"

      }),

    );

    final data = jsonDecode(
      response.body,
    );

    return data["sosHistory"];

  }

}