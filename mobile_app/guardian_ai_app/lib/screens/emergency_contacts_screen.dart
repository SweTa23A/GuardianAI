import 'package:flutter/material.dart';

import '../services/contact_service.dart';
import 'add_contact_screen.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState
    extends State<EmergencyContactsScreen> {

  List contacts = [];

  @override
  void initState() {
    super.initState();

    loadContacts();
  }

  Future<void> loadContacts() async {

    final data =
        await ContactService().getContacts();

    setState(() {
      contacts = data;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      

      appBar: AppBar(
        title: const Text(
          "Emergency Contacts",
        ),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton:
    FloatingActionButton(

  backgroundColor:
      Colors.purple,

  child:
      const Icon(Icons.add),

  onPressed: () {

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) =>
            const AddContactScreen(),

      ),

    );

  },

),

      body: ListView.builder(

        itemCount: contacts.length,

        itemBuilder: (context, index) {

          return ListTile(

            leading: const Icon(
              Icons.person,
            ),

            title: Text(
              contacts[index]["name"],
            ),

            subtitle: Text(
              contacts[index]["phone"],
            ),

          );

        },

      ),

    );
  }
}