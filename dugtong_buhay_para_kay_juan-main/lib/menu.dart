import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  // Placeholder for emergency info; update dynamically via API
  String emergencyContact = 'Emergency contact not set';
  String bloodType = 'Unknown';
  String allergies = 'None';

  @override
  void initState() {
    super.initState();
    _signInAndFetchData();
  }

  Future<void> _signInAndFetchData() async {
    try {
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      setState(() {
        _user = user;
      });

      // Call the API to fetch emergency info if the user is signed in
      if (_user != null) {
        await _fetchEmergencyInfo();
      }
    } catch (error) {
      print('Error signing in: $error');
    }
  }

  Future<void> _fetchEmergencyInfo() async {
    final apiUrl = 'https://your-api.com/user/emergency-info';
    final token = await _user?.authentication;

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${token?.idToken}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        emergencyContact = data['emergencyContact'] ?? 'Not set';
        bloodType = data['bloodType'] ?? 'Unknown';
        allergies = data['allergies'] ?? 'None';
      });
    } else {
      print('Failed to load emergency information');
    }
  }

  Future<void> _editEmergencyInfo() async {
    // Here you could show a form to update emergency info, then call an API to save it.
    final apiUrl = 'https://your-api.com/user/emergency-info';
    final token = await _user?.authentication;

    // Sample data to update
    final updatedInfo = {
      'emergencyContact': '123-456-7890',
      'bloodType': 'O+',
      'allergies': 'Peanuts',
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer ${token?.idToken}',
        'Content-Type': 'application/json',
      },
      body: json.encode(updatedInfo),
    );

    if (response.statusCode == 200) {
      // Update UI to reflect the new information
      await _fetchEmergencyInfo();
    } else {
      print('Failed to update emergency information');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Card with Picture and Welcome Note
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: _user != null
                          ? NetworkImage(_user!.photoUrl ?? '')
                          : AssetImage('assets/placeholder.png') as ImageProvider,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      _user != null ? 'Welcome, ${_user!.displayName}' : 'Welcome, Guest',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Emergency Information with Edit Option
            ListTile(
              title: const Text(
                'Emergency Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: GestureDetector(
                onTap: _editEmergencyInfo,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Emergency Contact: $emergencyContact'),
                  Text('Blood Type: $bloodType'),
                  Text('Allergies: $allergies'),
                ],
              ),
            ),

            const Spacer(),

            // Connect to Google Button
            ElevatedButton.icon(
              onPressed: _user == null ? _signInAndFetchData : null,
              icon: const Icon(Icons.account_circle),
              label: Text(_user == null ? 'Connect to Google' : 'Connected'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
