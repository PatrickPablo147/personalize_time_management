import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/colors.dart';
import 'line_chart.dart';

class ProgressChart extends StatelessWidget {
  final List<String> selectionList;

  const ProgressChart({
    Key? key,
    required this.selectionList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Title
                Text(
                  "Progress",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: (-0.5),
                  ),
                ),

                //Selection
                Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: highlight
                  ),
                  child: DropdownButtonFormField<String>(
                    //alignment: AlignmentDirectional.topStart,
                    icon: const Visibility(visible: false, child: Icon(Icons.keyboard_arrow_down),),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric( vertical: 5, horizontal: 16),
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: lGrey,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Daily",
                        hintStyle: GoogleFonts.inter(
                          color: lGrey,
                          fontSize: 12,
                          letterSpacing: -0.5,
                        )
                    ),
                    onChanged: (String? newValue) {
                    },
                    items: selectionList.map<DropdownMenuItem<String>>((String? value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value!,
                            style: GoogleFonts.inter(
                                color: lGrey,
                                fontSize: 12,
                                letterSpacing: -0.5
                            ),
                          )
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),

            //Graph
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: const LineChartSample2(),
            )
          ],
        ),
      ),
    );
  }
}
