import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        startQuiz();
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.rajdhani(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
      icon: const Icon(Icons.start),
      label: const Text('Start Quiz'),
    );
  }
}