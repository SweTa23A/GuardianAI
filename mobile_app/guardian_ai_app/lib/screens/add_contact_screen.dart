import 'package:flutter/material.dart';

import '../services/contact_service.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() =>
      _AddContactScreenState();
}

class _AddContactScreenState
    extends State<AddContactScreen> {

  final nameController =
      TextEditingController();

  final phoneController =
      TextEditingController();

  Future<void> saveContact() async {

    await ContactService().addContact(

      nameController.text,
      phoneController.text,

    );

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Add Contact",
        ),
        backgroundColor: Colors.purple,
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller:
                  nameController,
              decoration:
                  const InputDecoration(
                labelText: "Name",
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextField(
              controller:
                  phoneController,
              decoration:
                  const InputDecoration(
                labelText: "Phone",
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: saveContact,
              child:
                  const Text(
                "Save Contact",
              ),
            )

          ],

        ),

      ),

    );
  }
}