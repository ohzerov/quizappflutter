import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,
      {super.key, required this.chosenAnswers});

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            "You answered $numCorrQuestions out of $numTotalQuestions questions correctly!",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(getSummaryData()),
          const SizedBox(height: 30),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: restartQuiz,
            label: Text(
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
              "Restart the Quiz",
            ),
            icon: const Icon(Icons.restart_alt),
          )
        ]),
      ),
    );
  }
}
