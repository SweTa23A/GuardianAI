import 'dart:convert';

import 'package:http/http.dart' as http;

class ContactService {

  Future<void> addContact(
  String name,
  String phone,
) async {

  await http.post(

    Uri.parse(
      "http://localhost:5000/api/user/add-contact",
    ),

    headers: {
      "Content-Type": "application/json"
    },

    body: jsonEncode({

      "email": "riya@gmail.com",
      "name": name,
      "phone": phone,

    }),

  );

}

  Future<List<dynamic>> getContacts() async {

    final response = await http.post(

      Uri.parse(
        "http://localhost:5000/api/user/contacts",
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

    return data["emergencyContacts"];

  }
}