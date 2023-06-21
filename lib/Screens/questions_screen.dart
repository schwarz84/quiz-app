import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/Widgets/Widgets.dart';
import 'package:quiz_app/Data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionAnswer = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionAnswer < questions.length - 1
        ? currentQuestionAnswer++
        : currentQuestionAnswer = 0;
    });
  }

  @override
  Widget build(context) {

    final currentQuestion = questions[currentQuestionAnswer];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.rajdhani(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswer().map((answer) => AnswerButtons(answer: answer, onTap: answerQuestion)),
          ],
        ),
      ),
    );
  }
}