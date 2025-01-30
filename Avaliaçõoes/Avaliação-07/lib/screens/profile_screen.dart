import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = "Usuário";

  void _changeName(String newName) {
    setState(() {
      _name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Icon(Icons.person, size: 100, color: Colors.green),
          const SizedBox(height: 20),
          Text(
            'Nome: $_name',
            style: const TextStyle(fontSize: 20),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Digite seu nome'),
            onSubmitted: _changeName,
          ),
        ],
      ),
    );
  }
}
