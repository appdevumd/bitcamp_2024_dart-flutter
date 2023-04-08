// Import necessary packages
import 'package:flutter/material.dart'; // Flutter Material Design UI components
import 'package:flutter_bitcamp/explore_destinations.dart'; // ExploreDestinations class
import 'package:google_fonts/google_fonts.dart'; // Google Fonts package

void main() {
  runApp(const MyApp()); // Start the app by running the MyApp widget
}

// MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true, // Use Material3 theme
      ),
      home: const ExploreDestinations(), // Set ExploreDestinations as the home screen
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}
