import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'calendar_screen.dart';
import '../const/colors.dart';
import '../utils/achievements_tile.dart';
import '../utils/activity_chart_tile.dart';
import '../utils/category_list_tile.dart';
import '../utils/progress_chart_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> selectionList = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  List categoryList = [
    ["Personal", LineAwesomeIcons.user, .8],
    ["Health", LineAwesomeIcons.heart, .6],
    ["Study", LineAwesomeIcons.book_open, .9],
    ["Work", LineAwesomeIcons.briefcase, .3],
    ["Game", LineAwesomeIcons.gamepad, .1]
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
            child: Column(
              children: [
                _header(),
                const SizedBox(height: 12,),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProgressChart(selectionList: selectionList),
                        const SizedBox(height: 24,),
                        CategoryListTile(categoryList: categoryList),
                        const SizedBox(height: 24,),
                        Text(
                          "Your Activities",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.5
                          ),
                        ),
                        const SizedBox(height: 12,),
                        const ActivityChart(),
                        const SizedBox(height: 12,),
                        AchievementsTile(categoryList: categoryList)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  _header(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Date
        Row(
          children: [
            //day
            Text(
              "21",
              style: GoogleFonts.inter(
                letterSpacing: (-0.5),
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            //week -- Month, year
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wed",
                  style: GoogleFonts.inter(
                    letterSpacing: (-0.5),
                    fontWeight: FontWeight.w600,
                    color: lGrey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Nov, 2023",
                  style: GoogleFonts.inter(
                    letterSpacing: (-0.5),
                    fontWeight: FontWeight.w600,
                    color: lGrey,
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
        //Icon button
        Row(
          children: <Widget>[
            //calendar button
            IconButton(
              highlightColor: bgColor,
              splashRadius: 24,
              splashColor: primaryColor,
              onPressed: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarScreen()
                      )
                  ),
              icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    LineAwesomeIcons.calendar,
                    size: 24,
                    color: Colors.black87,
                  )
              ),
            ),
            //notification button
            IconButton(
              onPressed: () {},
              icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    LineAwesomeIcons.bell,
                    color: Colors.black87,
                  )
              ),
            ),
          ],
        )
      ],
    );
  }
}
