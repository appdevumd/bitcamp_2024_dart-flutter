// We need to use these special tools to make our app.
import 'package:flutter/material.dart';
import 'package:flutter_bitcamp/destination_page.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

// This is a special part of our app that shows a list of places to visit.
class ExploreDestinations extends StatelessWidget {
  // This is a magic word that helps our app work well.
  const ExploreDestinations({Key? key}) : super(key: key);

  // This tells our app how to draw and look nice.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // This helps us avoid problems when the keyboard pops up.
        resizeToAvoidBottomInset: false,
        // This is the top part of our app that has a title and menu button.
        appBar: AppBar(
          // This is how tall the top part is.
          toolbarHeight: 70,
          // This makes the top part look flat.
          elevation: 0,
          // This makes the top part see-through.
          backgroundColor: Colors.transparent,
          // This is the name of our app.
          title: const Text('Hello World'),
          // This is the menu button.
          leading: const Padding(
            // This is how much space is around the button.
            padding: EdgeInsets.only(left: 40, top: 40),
            // This is the menu icon.
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
        // This is the main part of our app where we show the list of places.
        body: SafeArea(
          child: Padding(
            // This is how much space is around the list of places.
            padding: const EdgeInsets.only(
              left: 40,
              top: 20,
              right: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // This is the big word "Explore" at the top.
                      Text(
                        "Explore",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // This makes a little space under the word "Explore".
                      const SizedBox(
                        height: 10,
                      ),
                      // This is where we can type to search for places.
                      Container(
                        height: 70,
                        width: 400,
                        decoration: BoxDecoration(
                          // This is the color of the search box.
                          color: const Color(0xffE1E1E1),
                          // This is the shape of the search box.
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Padding(
                            // This is how much space is inside the search box.
                            padding: const EdgeInsets.only(left: 20),
                            child: TextField(
                              // This makes the keyboard go above the screen.
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                // This is the search icon at the start of the box.
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                // This makes the box have no border.
                                border: InputBorder.none,
                                // This is the text inside the box.
                                hintText: "  Discover Places",
                                // This is how the text inside the box looks.
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
                // This makes a little space under the search box.
                const SizedBox(
                  height: 10,
                ),
                // This is the area where the list of places will be shown.
                Expanded(
                  flex: 6,
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      // These are the cards with information about each place.
                      DestinationCard(
                        city: "Venice",
                        country: "Italy",
                        distance: "68.8 km away",
                        cost: 20,
                        openingHours: "09:00 AM",
                        image:
                            "https://www.italiadelight.it/wp-content/uploads/2020/06/venezia-italian.jpg.webp",
                      ),
                      // This makes a little space between the cards.
                      SizedBox(
                        height: 30,
                      ),
                      DestinationCard(
                        city: "New York",
                        country: "USA",
                        cost: 25,
                        openingHours: "08:00 AM",
                        distance: "1035.8 km away",
                        image:
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/View_of_Empire_State_Building_from_Rockefeller_Center_New_York_City_dllu_%28cropped%29.jpg/1200px-View_of_Empire_State_Building_from_Rockefeller_Center_New_York_City_dllu_%28cropped%29.jpg",
                      ),
                      // This makes a little space between the cards.
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This is the card that shows information about each place.
class DestinationCard extends StatelessWidget {
// This is the magic word that helps the card work well.
  const DestinationCard({
    super.key,
    required this.distance,
    required this.image,
    required this.cost,
    required this.city,
    required this.country,
    required this.openingHours,
  });

// These are the important details about each place.
  final String distance;
  final String image;
  final int cost;
  final String city;
  final String country;
  final String openingHours;

// This tells the card how to draw and look nice.
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
// This makes the card go to a new page with more details.
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
        // This is the size of the card.
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          // This makes the card have round corners.
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          // This shows the picture of the place on the card.
          image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            // This makes the card have round corners.
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
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
              Expanded(
                flex: 2,
                child: Container(),
              ),
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
