import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/colors.dart';
import 'bar_chart.dart';

class ActivityChart extends StatelessWidget {
  const ActivityChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Status Tile
          Container(
            width: 186,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    "Status",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: -0.5
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  //Chart
                  Center(
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  //Chart Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Completed
                      Column(
                        children: [
                          Text(
                            '76',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5
                            ),
                          ),
                          Text(
                            "Complete",
                            style: GoogleFonts.inter(
                                color: lGrey,
                                fontSize: 12,
                                letterSpacing: -0.5
                            ),
                          ),
                        ],
                      ),
                      //Remaining
                      Column(
                        children: [
                          Text(
                            '32',
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5
                            ),
                          ),
                          Text(
                            "Remain",
                            style: GoogleFonts.inter(
                                color: lGrey,
                                fontSize: 12,
                                letterSpacing: -0.5
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //Habit Tile
          Container(
            width: 186,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  Text(
                    "Habit",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: -0.5
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  //Chart
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const BarChartSample1(),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //Chart Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Percent Value
                      Text(
                        "123",
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5
                        ),
                      ),

                      //Complete Text
                      Text(
                        "Total Task: ",
                        style: GoogleFonts.inter(
                            color: lGrey,
                            fontSize: 12,
                            letterSpacing: -0.5
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
