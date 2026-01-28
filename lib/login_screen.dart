import 'package:flutter/material.dart';
import 'main.dart'; // HomeScreen එකට යන්න මේක ඕන

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // නිකන් validation එකක් (හිස්ද කියලා බලන්න)
    if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // සාර්ථක නම් Home Screen එකට යන්න
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // දත්ත මදි නම් Warning එකක්
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter username and password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50], // ලා කොළ පාට පසුබිමක්
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Logo හෝ Icon එක
                const Icon(Icons.local_hospital, size: 80, color: Colors.teal),
                const SizedBox(height: 20),
                const Text(
                  "Hospital System",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                const SizedBox(height: 40),

                // 2. Username Input Box
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Password Input Box
                TextField(
                  controller: _passwordController,
                  obscureText: true, // අකුරු හැංගිලා පෙන්නන්න
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // 4. Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("LOGIN", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}