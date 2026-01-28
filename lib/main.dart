import 'package:flutter/material.dart';

void main() {
  runApp(const HospitalApp());
}

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Simple',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // මේක තමයි අපේ තාවකාලික Database එක (List එකක්)
  final List<Map<String, String>> _patients = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _diseaseController = TextEditingController();

  void _addPatient() {
    if (_nameController.text.isNotEmpty && _diseaseController.text.isNotEmpty) {
      setState(() {
        _patients.add({
          'name': _nameController.text,
          'disease': _diseaseController.text,
        });
      });
      _nameController.clear();
      _diseaseController.clear();
      Navigator.of(context).pop(); //
    }
  }

  void _showForm() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Patient"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: _diseaseController, decoration: const InputDecoration(labelText: "Disease")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text("Cancel")),
          ElevatedButton(onPressed: _addPatient, child: const Text("Add")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hospital Dashboard"), backgroundColor: Colors.teal),
      body: _patients.isEmpty
          ? const Center(child: Text("No patients added yet!"))
          : ListView.builder(
              itemCount: _patients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text(_patients[index]['name']![0].toUpperCase()),
                    ),
                    title: Text(_patients[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("Disease: ${_patients[index]['disease']!}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _patients.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showForm,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
