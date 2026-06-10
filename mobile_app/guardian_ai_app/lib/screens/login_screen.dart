import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

      Future<void> loginUser() async {

  try {

    final response = await http.post(

      Uri.parse(
        "http://localhost:5000/api/auth/login",
      ),

      headers: {
        "Content-Type": "application/json"
      },

      body: jsonEncode({

        "email": emailController.text,
        "password": passwordController.text

      }),

    );

    if (response.statusCode == 200) {

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ),
  );

} else {

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Login Failed"),
    ),
  );

}

  } catch (e) {

    print(e);

  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Icon(
                Icons.shield,
                size: 80,
                color: Colors.purple,
              ),

              const SizedBox(height: 20),

              const Text(
                "GuardianAI",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(

                onPressed: () {

  loginUser();

},  
                  child: const Text("Login"),
                ),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {},
                child: const Text("Create Account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}