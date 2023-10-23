import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../const/colors.dart';

class EventCard extends StatelessWidget {
  final bool isPast;

  const EventCard({
    required this.isPast,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      color: Colors.transparent,
      child: Row(
        children: [
          //Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Start time
              Text(
                "12:00",
                style: GoogleFonts.inter(
                    fontSize: 17,
                    letterSpacing: -0.5
                ),
              ),
              const SizedBox(height: 4,),
              //End time
              Text(
                "15:40",
                style: GoogleFonts.inter(
                    color: lGrey,
                    fontSize: 13,
                    letterSpacing: -0.5
                ),
              )
            ],
          ),

          //Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 4, top: 0, bottom: 4),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: isPast ? const [
                    BoxShadow(
                        color: primaryColor, // Shadow color
                        offset: Offset(0, 12.0), // Shadow position
                        blurRadius: 24.0,
                        spreadRadius: -4// Spread of the shadow
                    ),
                  ] : [],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Title -> Menu
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Study",
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.5
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8,),
                          //Note
                          Text(
                            "Note",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: lGrey,
                                letterSpacing: -0.5
                            ),
                          ),
                        ],
                      ),

                      //Date Range
                      Row(
                        children: [
                          const Icon(
                            LineAwesomeIcons.alternate_redo,
                            size: 16,
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            "none",
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                color: lGrey,
                                letterSpacing: -0.5
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
