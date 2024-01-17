import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/screens/ai/take_a_photo.dart';
import 'package:graduation_project/utils/colors/app_colors.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen(
      {Key? key, required this.image, required this.response})
      : super(key: key);
  final File image;
  final String response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                      height: 500,
                      width: MediaQuery.of(context).size.width - 50,
                      image))),
          const SizedBox(
            height: 22,
          ),
          Text(
            'Result is : $response',
            style: GoogleFonts.actor(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 22,
          ),
          Center(
              child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Camera(),
                  ));
            },
            child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "Try again!",
                    style: GoogleFonts.actor(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
