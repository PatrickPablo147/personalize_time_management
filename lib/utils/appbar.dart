import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../const/colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Back button
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 55, minHeight: 55),
          onPressed: () => Navigator.pop(context),
          elevation: 0,
          fillColor: primaryColor,
          highlightColor: lBlue,
          splashColor: lBlue,
          shape: const CircleBorder(
              side: BorderSide(
                  color: lBlue
              )
          ),
          child: const Icon(
            LineAwesomeIcons.arrow_left,
            size: 32,
            color: Colors.white,
          ),
        ),
        //Notification button
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
        )
      ],
    );
  }
}
