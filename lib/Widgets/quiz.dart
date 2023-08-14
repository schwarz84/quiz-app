import 'package:flutter/material.dart';

import '../Data/questions.dart';
import '../Screens/screens.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];

  var currentScreen = 'home-screen';

  void switcherScreen() {
    setState(() {
      currentScreen = 'questions-screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = 'result-screen';
      });
    }
  }

  void restarQuiz() {
    setState(() {
      selectedAnswers.clear();
      currentScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {

    Widget activeScreen = HomeScreen(switcherScreen);

    if (currentScreen == 'questions-screen') {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswers);
    }
    if (currentScreen == 'result-screen') {
      activeScreen = ResultScreen(chosenAnswer: selectedAnswers, restartQuiz: restarQuiz);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.5,
              colors: [
                Colors.red,
                Colors.indigo,
              ],
            )
          ),
          child: activeScreen
        )
      ),
    );
  }
}