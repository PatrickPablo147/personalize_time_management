import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../const/colors.dart';
import '../models/category.dart';
import 'add_task_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  final taskList = Category.generatedCategory();

  final _controller = TextEditingController();
  final iconList = [
    LineAwesomeIcons.calculator,
    LineAwesomeIcons.alternate_hospital,
    LineAwesomeIcons.add_to_shopping_cart,
    LineAwesomeIcons.airbnb,
    LineAwesomeIcons.alternate_headphones
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          body: Column(
            children: [
              _header(context),
              const SizedBox(height: 12,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: GridView.builder(
                      itemCount: taskList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 36,
                          mainAxisSpacing: 36
                      ),
                      itemBuilder: (context, index) =>
                      taskList[index].isLast ? _buildAddNew(context, index) : _buildAddTask(index)
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon List
                  // Container(
                  //   height: 80,
                  //   color: Colors.grey,
                  //   child: ListView.builder(
                  //     itemCount: iconList.length,
                  //     itemBuilder: (context, index) {
                  //       Column(
                  //         children: [
                  //           RawMaterialButton(
                  //             constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
                  //             onPressed: () {},
                  //             elevation: 0,
                  //             fillColor: Colors.white,
                  //             highlightColor: lBlue,
                  //             splashColor: lBlue,
                  //             shape: const CircleBorder(
                  //                 side: BorderSide(
                  //                     color: lBlue
                  //                 )
                  //             ),
                  //             child: Icon(
                  //                 iconList[index]
                  //             ),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),

                  //get user input
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Add a new category',
                        hintStyle: GoogleFonts.inter(
                          letterSpacing: -0.5,
                          color: lGrey,
                        )
                    ),
                  ),

                  //  button -> save + cancel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //save
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            taskList.insert(
                                taskList.length - 1,
                                Category(
                                    iconData: LineAwesomeIcons.circle,
                                    title: _controller.text,
                                    isLast: false
                                )
                            );
                            Navigator.pop(context);
                            _controller.clear();
                          });
                        },
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text(
                            'save',
                            style: GoogleFonts.inter(
                              letterSpacing: -0.5,
                            )
                        ),
                      ),
                      const SizedBox(width: 8,),
                      //cancel
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _controller.clear();
                        },
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text(
                          'cancel',
                          style: GoogleFonts.inter(
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  _buildAddNew(BuildContext context, int index) {
    return GestureDetector(
      onTap: (){
        _showDialog();
      },
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(16),
          dashPattern: const [20, 20],
          color: primaryColor,
          strokeWidth: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Column(
                children: [
                  //Icon
                  Icon(
                    taskList[index].iconData,
                    size: 32,
                  ),
                  const SizedBox(height: 12,),
                  //title
                  Text(
                    taskList[index].title.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  _buildAddTask(int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTaskScreen())
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: primaryColor, // Shadow color
                offset: Offset(0.2, 10.0), // Shadow position
                blurRadius: 24.0,
                spreadRadius: -4// Spread of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              //Icon
              Icon(
                taskList[index].iconData,
                size: 32,
              ),
              const SizedBox(
                height: 12,
              ),

              //Title
              Text(
                taskList[index].title.toString(),
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _header(BuildContext context){
    return Container(
      height: 230,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            ),
            const SizedBox(height: 24,),

            //Title
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Choose your \ntask category!",
                style: GoogleFonts.inter(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    color: primaryColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
