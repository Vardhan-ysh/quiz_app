import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(
          //   height: 150,
          // ),

          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 300,
          //   ),
          // ),

          Image.asset(
            color: const Color.fromARGB(150, 255, 255, 255),
            "assets/images/quiz-logo.png",
            width: 300,
          ),

          const SizedBox(
            height: 80,
          ),

          const Text(
            "Learn Flutter The Fun Way!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(237, 181, 18, 202),
            ),
            icon: const Icon(
              Icons.arrow_right_alt_outlined,
              color: Colors.white,
            ),
            label: const Text(
              "START THE QUIZ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
