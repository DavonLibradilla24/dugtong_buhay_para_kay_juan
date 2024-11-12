import 'package:dugtong_buhay_para_kay_juan/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins', // Assuming you've set up the Poppins font
      ),
      home: const FirstAid(),
    );
  }
}

class FirstAid extends StatelessWidget {
  const FirstAid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 63, 57),
        toolbarHeight: 90.0,
        title: const Text(""),
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/JDRlogo.png'), // Update with your image path
            radius: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 40,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstAid()),
              );
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StartPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.black, width: 2), // Black outline for the button
                  ),
                ),
                child: Text(
                  'HOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      // Adding a shadow to create a text outline effect
                      Shadow(
                        offset: Offset(1.0, 1.0), // Direction of the shadow
                        blurRadius: 3.0, // The blur radius for soft edges
                        color: Colors.black.withOpacity(0.6), // Black shadow color with opacity
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildIconTile('Wound Care', 'assets/icons/wounded.png'),
                    _buildIconTile('Fever', 'assets/icons/fever.png'),
                    _buildIconTile('Sore Eyes', 'assets/icons/sore-eyes.png'),
                    _buildIconTile('Nose Bleed', 'assets/icons/nose-bleeding.png'),
                    _buildIconTile('Sprain', 'assets/icons/leg.png'),
                    _buildIconTile('Bone Fracture', 'assets/icons/broken-bone.png'),
                    _buildIconTile('Heart Attack', 'assets/icons/heart-attack.png'),
                    _buildIconTile('Stroke', 'assets/icons/stroke.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconTile(String label, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Handle tile tap (navigate to another screen or show details)
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black, // Black border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use Image.asset to load the custom icon
            Image.asset(
              imagePath,
              width: 90, // Set the size as needed
              height: 90,
              fit: BoxFit.contain, // Adjust the fit as needed
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
