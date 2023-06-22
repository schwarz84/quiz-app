import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getResumenTotal() {
    List<Map<String, Object>> resumen = [];

    for(var i = 0; i < chosenAnswer.length; i++) {
      resumen.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return resumen;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chosenAnswer.toString(),
            style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            'Aca va las respuestas !!!!!!!!!!!1',
            style: GoogleFonts.rajdhani(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {

            },
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.rajdhani(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text('Restart Quiz'),
          )
        ]),
      ),
    );
  }
}