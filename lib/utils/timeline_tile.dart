import 'package:flutter/material.dart';
import 'package:personalize_time_management/utils/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../const/colors.dart';

class TimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final double timelineLength;
  const TimeLineTile({
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.timelineLength,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast ?
            primaryColor : lGrey
        ),
        indicatorStyle: IndicatorStyle(
            width: 16,
            color: isPast ? primaryColor : lGrey,
            drawGap: true,
            indicatorXY: timelineLength,
            iconStyle: IconStyle(
                iconData: Icons.circle,
                color: bgColor,
                fontSize: 12
            )
        ),
        endChild: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment(0, -1 + (3 * timelineLength.clamp(-1, 1))),
              child: EventCard(isPast: isPast,),
            )
        ),
      ),
    );
  }
}
