import 'package:flutter/cupertino.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Category {
  IconData? iconData;
  String? title;
  bool isLast;

  Category({
    this.iconData,
    this.title,
    this.isLast = false
  });

  static List<Category> generatedCategory() {
    return [
      Category(
        iconData: LineAwesomeIcons.user,
        title: 'Personal',
      ),
      Category(
        iconData: LineAwesomeIcons.heart,
        title: 'Health',
      ),
      Category(
        iconData: LineAwesomeIcons.book_open,
        title: 'Study',
      ),
      Category(
        iconData: LineAwesomeIcons.briefcase,
        title: 'Work',
      ),
      Category(
        iconData: LineAwesomeIcons.gamepad,
        title: 'Game',
      ),
      Category(
          iconData: LineAwesomeIcons.plus,
          title: 'Another',
          isLast: true
      )
    ];
  }
}