import 'package:dugtong_buhay_para_kay_juan/first_aid_page.dart';
import 'package:dugtong_buhay_para_kay_juan/hospital_page.dart';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins', // Apply 'Poppins' globally
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  // // Location permission function
  // Future<void> _requestLocationPermission() async {
  //   if (await Permission.location.request().isGranted) {
  //     // Permission granted, proceed with accessing location
  //   } else {
  //     // Handle permission denial
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 63, 57),
        toolbarHeight: 70,
        title: Center(
          child: Transform.scale(
            scale: 0.4,
            child: Image.asset(
              'assets/JDRlogo.png', // Path to your logo image
              fit: BoxFit.contain,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 40,
            onPressed: () {
              // Define functionality here
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal,
              Colors.white,
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'LEARN:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildButton(
                  label: 'Basic Life Support',
                  color: Colors.red,
                  onPressed: () {
                    // onPressed activity
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  label: 'FIRST AID',
                  color: Colors.green,
                  onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstAid()),
                  );   
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                ),
                const SizedBox(height: 100),
                const Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
                const SizedBox(height: 30),
                _buildIconButton(
                  iconPath: 'assets/icons/hospital.png',
                  label: 'HOSPITAL',
                  color: Colors.orange,
                  onPressed:(){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HospitalPage()),
                  );   

                  }
                ),
                const SizedBox(height: 10),
                _buildIconButton(
                  iconPath: 'assets/icons/youtube.png',
                  label: 'TUTORIAL',
                  color: Colors.red,
                  onPressed: () {
                    // Add Tutorial button function here
                  },
                ),
                const SizedBox(height: 10),
                _buildIconButton(
                  iconPath: 'assets/icons/facebook.png',
                  label: 'UPDATES',
                  color: Colors.blue,
                  onPressed: () {
                    // Add Updates button function here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
    required EdgeInsets padding,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: padding,
        textStyle: const TextStyle(fontSize: 18),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.black, width: 2), // Outline for the button
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          shadows: [
            Shadow(
              offset: Offset(1.0, 1.0), // The shadow's direction
              blurRadius: 3.0, // The blur radius
              color: Colors.black.withOpacity(0.6), // The shadow color with opacity
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required String iconPath,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        side: const BorderSide(color: Colors.black, width: 2), // Black outline for the button
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: Image.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
      label: Stack(
        children: [
          // Outlined text layer
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.black, // Outline color
            ),
          ),
          // Solid text layer
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Main text color
            ),
          ),
        ],
      ),
    );
  }
}
