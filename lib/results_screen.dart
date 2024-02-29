import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.chosenAnswers,
    super.key,
    required this.onRestart,
  });

  final Function() onRestart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": chosenAnswers[i],
        },
      );
    }

    // final Map<String, int> a = {
    //   "no.1": 1,
    //   "no.2": 2,
    // };

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int numTotalQuestions = questions.length;
    final int numCorrectQuestions = (summaryData.where((data) {
      return (data["user_answer"] == data["correct_answer"]);
    })).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "YOU ANSWERED ",
                    style: GoogleFonts.autourOne(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: "$numCorrectQuestions out of $numTotalQuestions",
                    style: GoogleFonts.bungeeSpice(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: " ANSWERS CORRECTLY",
                    style: GoogleFonts.autourOne(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              numCorrectQuestions: numCorrectQuestions,
              numTotalQuestions: numTotalQuestions,
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            FilledButton.icon(
              onPressed: onRestart,
              style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 212, 167, 90),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text(
                "Restart the quiz",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
