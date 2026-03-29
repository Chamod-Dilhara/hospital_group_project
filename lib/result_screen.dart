import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String disease;
  final String age;

  const ResultScreen({super.key, required this.name, required this.disease, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Record', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF203A43),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: const Color(0xFF203A43).withOpacity(0.15), blurRadius: 30, offset: const Offset(0, 15))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: const Color(0xFFE8F5E9), shape: BoxShape.circle, border: Border.all(color: const Color(0xFF2E7D32), width: 3)),
                  child: const Icon(Icons.check_circle_outline, size: 60, color: Color(0xFF2E7D32)),
                ),
                const SizedBox(height: 20),
                const Text('Successfully Saved!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF203A43))),
                const SizedBox(height: 30),
                const Divider(thickness: 1.5),
                const SizedBox(height: 20),
                _buildInfoRow(Icons.person, 'Name', name),
                const SizedBox(height: 20),
                _buildInfoRow(Icons.cake, 'Age', '$age Years'),
                const SizedBox(height: 20),
                _buildInfoRow(Icons.medical_information, 'Disease', disease),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFF203A43), width: 2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    child: const Text('Go Back', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF203A43))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: const Color(0xFF203A43)),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }
}