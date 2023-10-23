import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../const/colors.dart';
import '../utils/appbar.dart';
import '../utils/timeline_tile.dart';
import 'category_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent('MultiDay Event A',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        color: Colors.orange,
        isMultiDay: true),
    NeatCleanCalendarEvent('Allday Event B',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        color: Colors.pink,
        isAllDay: true),
    NeatCleanCalendarEvent('Normal Event D',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 17, 0),
        color: Colors.indigo),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen())),
            backgroundColor: primaryColor,
            elevation: 0,
            shape: const CircleBorder(
                side: BorderSide(
                    color: lBlue
                )
            ),
            child: const Icon(LineAwesomeIcons.plus, color: Colors.white,),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 24, left: 12, right: 12,),
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 24,),
                Expanded(
                  child: _calendarTile(),
                )
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: [
                //         Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: 200,
                //           color: Colors.blueAccent,
                //         ),
                //         const SizedBox(height: 16,),
                //
                //         _timelineTile(),
                //         const SizedBox(height: 40,)
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        )
    );
  }

  _calendarTile() {
    return Calendar(
      hideBottomBar: true,
      startOnMonday: false,
      weekDays: const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      eventsList: _eventList,
      eventListBuilder: (context, day) {
        return Expanded(
          child: _timelineTile(),
        );
      },
      isExpandable: true,
      isExpanded: false,
      defaultDayColor: Colors.black,
      eventDoneColor: Colors.green,
      selectedColor: primaryColor,
      selectedTodayColor: secondaryColor,
      todayColor: Colors.blue,
      eventColor: null,
      locale: 'en_ISO',
      todayButtonText: '',
      allDayEventText: 'All day',
      multiDayEndText: 'End',
      expandableDateFormat: 'EEEE, dd. MMMM yyyy',
      datePickerType: DatePickerType.date,
      dayOfWeekStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w800,
        fontSize: 12,
        letterSpacing: -0.5
      ),
    );
  }

  _timelineTile() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        TimeLineTile(isFirst: true, isLast: false, isPast: true, timelineLength: 0.1,),
        TimeLineTile(isFirst: false, isLast: false, isPast: true, timelineLength: 0,),
        TimeLineTile(isFirst: false, isLast: true, isPast: false, timelineLength: 1,),
      ],
    );
  }
}
