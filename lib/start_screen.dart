import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(155, 255, 255, 255),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              "Learn Flutter the fun way!",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 37, 150),
              ),
              icon: const Icon(
                Icons.arrow_right_alt,
              ),
              label: const Text("!Start Quiz"),
            ),
          ),
        ],
      ),
    );
  }
}
