import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/colors.dart';

class CategoryListTile extends StatelessWidget {
  final List categoryList;
  const CategoryListTile({
    Key? key,
    required this.categoryList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 5),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 48),
              child: Column(
                children: [
                  //Icon Button
                  RawMaterialButton(
                    constraints: const BoxConstraints(minWidth: 55, minHeight: 55),
                    onPressed: () {},
                    elevation: 0,
                    fillColor: Colors.white,
                    highlightColor: lBlue,
                    splashColor: lBlue,
                    shape: const CircleBorder(
                        side: BorderSide(
                            color: lBlue
                        )
                    ),
                    child: Icon(
                        categoryList[index][1]
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),

                  //Icon Title
                  Text(
                    categoryList[index][0],
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
