import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../responsive/size_fuctions.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context) * 0.30,
      height: double.maxFinite,
      // color: Colors.white,
      margin: EdgeInsets.only(left: getWidth(context) * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card(
          //   elevation: 10.0,
          //   color: Color.fromARGB(255, 116, 118, 255),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SizedBox(
          //       width: getWidth(context) * 0.20,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Moves : 00",
          //             style: TextStyle(
          //                 fontSize: getWidth(context) * 0.0267,
          //                 fontWeight: FontWeight.bold,
          //                 fontFamily:
          //                     GoogleFonts.lato().fontFamily,
          //                 color: Colors.white),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: getHeight(context) * 0.04,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(context) * 0.03,
                vertical: getHeight(context) * 0.027,
              ),
              primary: Color.fromARGB(255, 255, 74, 61),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {},
            icon: Icon(Icons.start_rounded),
            label: Text(
              "Start",
              style: TextStyle(
                fontSize: getWidth(context) * 0.0266,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lato().fontFamily,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
