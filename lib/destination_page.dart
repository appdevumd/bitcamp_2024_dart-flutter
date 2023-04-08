// We need these special tools to make our app pretty.
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// This is the part of our app that shows more information about a place.
class DestinationPage extends StatelessWidget {
  // We need these pieces of information to show the right details.
  const DestinationPage({
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

  // This tells our app how to draw and look nice.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We're making the background a special color.
      backgroundColor: const Color(0xff384160),
      // We're putting things in a column to arrange them nicely.
      body: Column(
        children: [
          // This shows the picture of the place.
          Expanded(
            flex: 46,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // This shows the details about the place.
          Expanded(
            flex: 54,
            child: Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Align(
                alignment: Alignment.topLeft,
                child: ListView(
                  // This makes the details scroll if they're too long.
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    // This row shows the place name, country, and cost.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // This shows the place name and country.
                        Expanded(
                          flex: 7,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // This leaves some space.
                                const SizedBox(
                                  height: 20,
                                ),
                                // This shows the place name.
                                AutoSizeText(
                                  city,
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 43,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // This shows the country.
                                Text(
                                  country,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    height: 1.0,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // This shows the cost.
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // This leaves some space.
                              const SizedBox(
                                height: 20,
                              ),
                              // This shows the cost.
                              Text(
                                "\$" + cost.toString(),
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 43,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // This says "Per Person".
                              Text(
                                "Per Person",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  height: 1.0,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // This leaves some space.
                    const SizedBox(
                      height: 20,
                    ),
                    // This draws a line.
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                      height: 20,
                    ),
                    // This leaves some space.
                    const SizedBox(
                      height: 20,
                    ),
                    // This row shows the location.
                    Row(
                      children: [
                        // This shows a location icon.
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff888D9C),
                          ),
                          width: 70,
                          height: 70,
                          child: const Center(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        // This leaves some space.
                        const SizedBox(
                          width: 20,
                        ),
                        // This shows the city and country.
                        Text(
                          city + ", " + country,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    // This leaves some space.
                    const SizedBox(
                      height: 7,
                    ),
                    // This row shows the opening hours.
                    Row(
                      children: [
                        // This shows a clock icon.
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff888D9C),
                          ),
                          width: 70,
                          height: 70,
                          child: const Center(
                            child: Icon(
                              Icons.alarm,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                        // This leaves some space.
                        const SizedBox(
                          width: 20,
                        ),
                        // This shows the opening hours.
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // This leaves some space.
                            const SizedBox(
                              height: 20,
                            ),
                            // This says "Open".
                            Text(
                              "Open",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            // This leaves some space.
                            const SizedBox(
                              height: 10,
                            ),
                            // This shows the opening hours.
                            Text(
                              openingHours,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                height: 1.0,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // This leaves some space.
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    // This leaves some space.
                    SizedBox(
                      height: 10,
                    ),
                    // This shows a "Book Now" button.
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff888D9C),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 75,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    // This leaves some space.
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
