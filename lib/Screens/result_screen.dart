import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Widgets/widgets.dart';
import 'package:quiz_app/Widgets/question_resumen.dart';

import '../Data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer, required this.restartQuiz});

  final List<String> chosenAnswer;
  final void Function() restartQuiz;

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

    final getResumenData = getResumenTotal();
    final questionCount = questions.length;
    final rightCount = getResumenData.where((item) {
      return item['correct_answer'] == item['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Respondiste $rightCount correctas de un total de $questionCount preguntas',
            style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionResumen(resumenData: getResumenData),
          const SizedBox(height: 30),
          RestartQuizButton(restartQuiz: restartQuiz),
        ]),
      ),
    );
  }
}