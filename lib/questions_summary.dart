import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
    required this.numCorrectQuestions,
    required this.numTotalQuestions,
  });

  final List<Map<String, Object>> summaryData;
  final int numCorrectQuestions;
  final int numTotalQuestions;

  Color answerCheck(Object userAnswer, Object correctAnswer) {
    final String submitted = userAnswer as String;
    final String correct = correctAnswer as String;

    if (submitted == correct) {
      return const Color.fromARGB(193, 23, 232, 33);
    } else {
      return const Color.fromARGB(172, 255, 83, 83);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CircleAvatar(
                        backgroundColor: answerCheck(
                          data["user_answer"] as Object,
                          data["correct_answer"] as Object,
                        ),
                        radius: 15,
                        child: Text(
                          ((data["question_index"] as int) + 1).toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["question"].toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data["user_answer"].toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: answerCheck(
                                data["user_answer"] as Object,
                                data["correct_answer"] as Object,
                              ),
                            ),
                          ),
                          Text(
                            data["correct_answer"].toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
