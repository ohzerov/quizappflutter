import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox.square(
                    dimension: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: data['user_answer'] == data['correct_answer']
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(100)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          ((data['question_index'] as int) + 1).toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            data['question'] as String,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 78, 10, 97),
                              fontWeight: FontWeight.normal,
                            ),
                            data['user_answer'] as String,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: data['user_answer'] ==
                                        data['correct_answer']
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold),
                            data['correct_answer'] as String,
                            textAlign: TextAlign.start,
                          ),
                        ]),
                  ),
                  const SizedBox(height: 120),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
