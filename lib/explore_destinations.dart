

import 'package:flutter/material.dart';
import 'package:flutter_bitcamp/destination_page.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ExploreDestinations extends StatefulWidget {
  const ExploreDestinations({Key? key}) : super(key: key);

  @override
  _ExploreDestinationsState createState() => _ExploreDestinationsState();
}

class _ExploreDestinationsState extends State<ExploreDestinations> {
  List<dynamic> destinations = [];

  @override
  void initState() {
    super.initState();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/get_all'));
    if (response.statusCode == 200) {
      setState(() {
        destinations = json.decode(response.body);
      });
    } else {
      // handle errors as needed
      print('Failed to load destinations: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Padding(
            padding: EdgeInsets.only(left: 40, top: 40),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffE1E1E1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                border: InputBorder.none,
                                hintText: "  Discover Places",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: destinations.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: destinations.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 30),
                          itemBuilder: (context, index) {
                            final dest = destinations[index];
                            return DestinationCard(
                              city: dest['city'],
                              country: dest['country'],
                              distance: dest['distance'],
                              cost: dest['cost'],
                              openingHours: dest['openingHours'],
                              image: dest['image'],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    super.key,
    required this.distance,
    required this.image,
    required this.cost,
    required this.city,
    required this.country,
    required this.openingHours,
  });

  final String distance;
  final String image;
  final int cost;
  final String city;
  final String country;
  final String openingHours;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationPage(
              distance: distance,
              image: image,
              cost: cost,
              city: city,
              country: country,
              openingHours: openingHours,
            ),
          ),
        );
      },
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            height: 1.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        distance,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





///////////////////////////////////////


// // Import the Flutter framework's material design library, which provides 
// // pre-built widgets and tools for creating visually appealing and responsive 
// // user interfaces that follow the Material Design guidelines.
// import 'package:flutter/material.dart';

// // Import a custom widget called DestinationPage from the 
// // 'destination_page.dart' file.
// import 'package:flutter_bitcamp/destination_page.dart';

// // Import the flutter_bounceable package, which provides a widget called
// // Bounceable that adds a bouncy animation effect to its child widget when 
// // tapped. This enhances the user experience and interactivity.
// import 'package:flutter_bounceable/flutter_bounceable.dart';

// // Import the Google Fonts package, which allows easy integration of custom 
// // fonts from the Google Fonts library into the Flutter app, enabling 
// // typography customization and improving the app's visual appeal.
// import 'package:google_fonts/google_fonts.dart';

// // Define a stateless widget called ExploreDestinations, which represents 
// // the screen that displays a list of travel destinations for the user to 
// // explore. Stateless widgets are immutable and their properties cannot 
// // change once they are created.
// class ExploreDestinations extends StatelessWidget {
//   // Define a constructor for ExploreDestinations that accepts an optional 
//   // key parameter. The key is used by Flutter's framework to uniquely 
//   // identify widgets and efficiently update the widget tree when necessary.
//   const ExploreDestinations({Key? key}) : super(key: key);

//   // Override the build() method, which is called by Flutter's framework to
//   // build the widget tree for this widget. It takes the current BuildContext
//   // as a parameter, which provides information about the widget's location
//   // in the tree and allows interaction with other widgets and the framework.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // Set resizeToAvoidBottomInset to false to prevent the screen from
//         // resizing when the keyboard appears, which can cause layout issues.
//         resizeToAvoidBottomInset: false,
//         // Define the app bar using the AppBar widget, which is a Material 
//         // Design app bar that appears at the top of the screen.
//         appBar: AppBar(
//           // Set the height of the app bar using the toolbarHeight property.
//           toolbarHeight: 70,
//           // Set the elevation of the app bar to 0, creating a flat appearance.
//           elevation: 0,
//           // Set the background color of the app bar to transparent.
//           backgroundColor: Colors.transparent,

//           // Add a menu icon to the leading side of the app bar using the 
//           // Icon widget and the Padding widget to add spacing.
//           leading: const Padding(
//             padding: EdgeInsets.only(left: 40, top: 40),
//             child: Icon(
//               Icons.menu,
//               color: Colors.black,
//               size: 40,
//             ),
//           ),
//         ),

//         // Define the main content of the screen using the body property 
//         // and the SafeArea widget, which ensures that the content is not
//         // obscured by device notches or system UI elements.
//         body: SafeArea(
//           child: Padding(
//             // Add padding around the content using the Padding widget.
//             padding: const EdgeInsets.only(
//               left: 40,
//               top: 20,
//               right: 40,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Display the "Explore" text using the Text widget and 
//                       // style it using the GoogleFonts package and TextStyle.
//                       Text(
//                         "Explore",
//                         style: GoogleFonts.poppins(
//                           textStyle: const TextStyle(
//                             fontSize: 55,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       // Add a small vertical space using the SizedBox widget.
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       // Create a search bar using the Container widget and 
//                       // style it with a specific height, width, color, and 
//                       // border radius.
//                       Container(
//                         height: 70,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: const Color(0xffE1E1E1),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Container(
//                               child: TextField(
//                                 // Set the keyboard action to search when the 
//                                 // user taps the search button on the keyboard.
//                                 textInputAction: TextInputAction.search,
//                                 decoration: InputDecoration(
//                                   // Add a search icon to the start of the 
//                                   // search bar using the prefixIcon property.
//                                   prefixIcon: const Icon(
//                                     Icons.search,
//                                     color: Colors.black,
//                                     size: 40,
//                                   ),
//                                   // Remove the border around the search bar 
//                                   // using InputBorder.none.
//                                   border: InputBorder.none,
//                                   // Set the hint text for the search bar.
//                                   hintText: "  Discover Places",
//                                   // Style the hint text using GoogleFonts and 
//                                   // TextStyle.
//                                   hintStyle: GoogleFonts.poppins(
//                                     fontSize: 20,
//                                     color: Colors.black.withOpacity(0.7),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
    
//                 // Create a scrollable list of destination cards using the 
//                 // Expanded widget and the ListView widget.
//                 Expanded(
//                   flex: 6,
//                   child: ListView(
//                     padding:  EdgeInsets.zero,
//                     // Set shrinkWrap to true to allow the ListView to scroll 
//                     // within its parent's bounds.
//                     shrinkWrap: true,
//                     children: const [
//                       // Add destination cards to the list using the 
//                       // DestinationCard widget and pass the required data.
//                       DestinationCard(
//                         city: "Venice",
//                         country: "Italy",
//                         distance: "68.8 km away",
//                         cost: 20,
//                         openingHours: "09:00 AM",
//                         image:
//                             "https://lp-cms-production.imgix.net/2021-06/GettyRF_543346423.jpg",
//                       ),
//                       // Add a small vertical space between the cards using 
//                       // the SizedBox widget.
//                       SizedBox(
//                         height: 30,
//                       ),
//                       DestinationCard(
//                         city: "New York",
//                         country: "USA",
//                         cost: 25,
//                         openingHours: "08:00 AM",
//                         distance: "1035.8 km away",
//                         image:
//                             "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/View_of_Empire_State_Building_from_Rockefeller_Center_New_York_City_dllu_%28cropped%29.jpg/1200px-View_of_Empire_State_Building_from_Rockefeller_Center_New_York_City_dllu_%28cropped%29.jpg",
//                       ),
//                       // Add a small vertical space between the cards using 
//                       // the SizedBox widget.
//                       SizedBox(
//                         height: 30,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Define a stateless widget called DestinationCard, which represents a card 
// // that displays information about a specific destination. Stateless widgets 
// // are immutable and their properties cannot change once they are created.
// class DestinationCard extends StatelessWidget {
//   // Define a constructor for DestinationCard that accepts the required data 
//   // for each destination card, such as distance, image, cost, city, country, 
//   // and opening hours.
//   const DestinationCard({
//     super.key,
//     required this.distance,
//     required this.image,
//     required this.cost,
//     required this.city,
//     required this.country,
//     required this.openingHours,
//   });

//   // Declare the final variables to store the data passed through the 
//   // constructor. These variables can be accessed within the widget.
//   final String distance;
//   final String image;
//   final int cost;
//   final String city;
//   final String country;
//   final String openingHours;

//   // Override the build() method to define the UI of the DestinationCard widget.
//   @override
//   Widget build(BuildContext context) {
//     return Bounceable(
//       // Add an onTap gesture to the Bounceable widget, which triggers a 
//       // navigation event to the DestinationPage when the card is tapped.
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DestinationPage(
//               distance: distance,
//               image: image,
//               cost: cost,
//               city: city,
//               country: country,
//               openingHours: openingHours,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         // Set the size of the destination card using the height and width 
//         // properties.
//         height: 300,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           // Add rounded corners to the card using the borderRadius property.
//           borderRadius: const BorderRadius.all(
//             Radius.circular(20),
//           ),
//           // Display the destination image as the background of the card 
//           // using the DecorationImage widget.
//           image: DecorationImage(
//             image: NetworkImage(
//               image,
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             // Add rounded corners to the card using the borderRadius property.
//             borderRadius: const BorderRadius.all(
//               Radius.circular(20),
//             ),
//             // Add a gradient overlay to the card using the LinearGradient 
//             // widget, which creates a smooth transition between two colors.
//             gradient: LinearGradient(
//               begin: Alignment.bottomRight,
//               colors: [
//                 Colors.black.withOpacity(0.9),
//                 Colors.black.withOpacity(0.2),
//               ],
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Container(),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 25),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Display the city name using the Text widget and style 
//                       // it using GoogleFonts and TextStyle.
//                       Text(
//                         city,
//                         style: GoogleFonts.poppins(
//                           textStyle: const TextStyle(
//                             fontSize: 40,
//                             height: 1.0,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       // Display the distance using the Text widget and style 
//                       // it using GoogleFonts and TextStyle.
//                       Text(
//                         distance,
//                         style: GoogleFonts.poppins(
//                           textStyle: const TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w200,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }