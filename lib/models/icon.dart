import 'package:flutter/cupertino.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Icons {
  IconData? iconData;

  Icons({
    this.iconData
  });

  static List generatedIconList() {
    return [
      Icons(
          iconData: LineAwesomeIcons.landmark
      ),
      Icons(
          iconData: LineAwesomeIcons.laptop
      ),
      Icons(
          iconData: LineAwesomeIcons.newspaper
      ),
      Icons(
          iconData: LineAwesomeIcons.add_to_shopping_cart
      )

    ];
  }
}