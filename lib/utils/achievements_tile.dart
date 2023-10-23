import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/colors.dart';

class AchievementsTile extends StatelessWidget {
  final List categoryList;
  const AchievementsTile({
    Key? key,
    required this.categoryList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    children: [
                      //Icon
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 12),
                        child: SizedBox(
                          width: 40,
                          child: Icon(
                            categoryList[index][1],
                            size: 24,
                          ),
                        ),
                      ),

                      //Information Details -> Cat title -> Achievement -> line progress
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              //Category
                              Text(
                                categoryList[index][0],
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    letterSpacing: -0.5
                                ),
                              ),
                              const SizedBox(height: 4,),

                              //Achievement
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Achievement",
                                    style: GoogleFonts.inter(
                                        color: lGrey,
                                        letterSpacing: -0.5
                                    ),
                                  ),
                                  Text(
                                    "+29",
                                    style: GoogleFonts.inter(
                                        color: lGrey,
                                        letterSpacing: -0.5
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12,),

                              //Line progress
                              LinearProgressIndicator(
                                backgroundColor: highlight,
                                borderRadius: BorderRadius.circular(3),// Background color
                                valueColor: const AlwaysStoppedAnimation<Color>(primaryColor), // Progress color
                                value: categoryList[index][2], // Set progress to 50%
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}
