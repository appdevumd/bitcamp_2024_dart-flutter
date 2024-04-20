// Import the Flutter framework's material design library, which provides 
// pre-built widgets and tools for creating visually appealing and responsive 
// user interfaces that follow the Material Design guidelines.
import 'package:flutter/material.dart';

// Import a custom widget called ExploreDestinations from the 
// 'explore_destinations.dart' file located in the 'lib' directory of the
// Flutter project.
import 'package:flutter_bitcamp/explore_destinations.dart';

// Import the Google Fonts package, which allows easy integration of custom 
// fonts from the Google Fonts library into the Flutter app, enabling 
// typography customization and enhancing the app's visual appeal.
import 'package:google_fonts/google_fonts.dart';

// Define the main entry point of the Flutter app using the `main()` function.
// This function is called when the app starts and is responsible for 
// initializing and running the app.

void main() {
  // Run the app by calling `runApp()` and passing an instance of the root
  // widget, `MyApp`, which serves as the starting point for building the 
  // widget tree that represents the app's user interface.
  runApp(const MyApp());
}

// Define a stateless widget called `MyApp`, which represents the root widget 
// of the app. Stateless widgets are immutable and their properties cannot 
// change once they are created, making them efficient for parts of the UI
// that don't require frequent updates.
class MyApp extends StatelessWidget {
  // Define a constructor for `MyApp` that accepts an optional `key` parameter.
  // The `key` is used by Flutter's framework to uniquely identify widgets and
  // efficiently update the widget tree when necessary.
  const MyApp({Key? key}) : super(key: key);

  // Override the `build()` method, which is called by Flutter's framework to
  // build the widget tree for this widget. It takes the current `BuildContext`
  // as a parameter, which provides information about the widget's location
  // in the tree and allows interaction with other widgets and the framework.
  @override
  Widget build(BuildContext context) {
    // Return a `MaterialApp` widget, which is a convenience widget that wraps
    // the app in a `Navigator` and provides a default app structure with 
    // Material Design components and theming.
    return MaterialApp(
      // Set the app's theme using the `theme` property and `ThemeData` class.
      // Here, `useMaterial3` is set to `true` to enable the use of Material
      // Design 3 components and styles, which offer an updated and modern look.
      theme: ThemeData(
        useMaterial3: true,
      ),
      // Set the initial route or home page of the app using the `home` property.
      // In this case, it is set to an instance of the `ExploreDestinations` 
      // widget, which likely displays a list or grid of travel destinations.
      home: const ExploreDestinations(),
      
      // Disable the debug banner in the top-right corner of the app by setting
      // `debugShowCheckedModeBanner` to `false`. The debug banner is shown by
      // default in debug mode to indicate that the app is running in debug mode.
      debugShowCheckedModeBanner: false,
    );
  }
}