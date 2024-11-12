import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'splash_screen.dart'; // Assuming splash_screen.dart is your custom splash screen widget

void main() async {
  // Load environment variables for Google Maps API key (if applicable)
  await dotenv.load(fileName: "map.env"); // Adjust path if necessary

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', // Set the custom font as the default
      ),
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: const SplashScreen(), // Set the splash screen as the home
    );
  }
}