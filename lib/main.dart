// We need to use these special tools to make our app.
import 'package:flutter/material.dart';
import 'package:flutter_bitcamp/explore_destinations.dart';
import 'package:google_fonts/google_fonts.dart';

// This is where our app starts.
void main() {
  runApp(const MyApp());
}

// This is the main part of our app.
class MyApp extends StatelessWidget {
  // This is a magic word that helps our app work well.
  const MyApp({Key? key}) : super(key: key);

  // This tells our app how to draw and look nice.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // This helps our app use some new, cool things.
      theme: ThemeData(
        useMaterial3: true,
      ),
      // This is the first thing we see when we open the app.
      home: const ExploreDestinations(),
      // This makes sure we don't see a little banner in the corner.
      debugShowCheckedModeBanner: false,
    );
  }
}
