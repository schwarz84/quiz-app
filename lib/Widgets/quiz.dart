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

  // Widget? currentScreen;
  //
  // @override
  // void initState() {
  //   currentScreen = HomeScreen(switcherScreen);
  //   super.initState();
  // }

  // void switcherScreen() {
  //   setState(() {
  //     currentScreen = const QuestionsScreen();
  //   });
  // }
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

  @override
  Widget build(context) {

    Widget activeScreen = HomeScreen(switcherScreen);

    if (currentScreen == 'questions-screen') {
      activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswers);
    }
    if (currentScreen == 'result-screen') {
      activeScreen = ResultScreen(chosenAnswer: selectedAnswers);
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

//   @override
//   Widget build(context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           body:Container(
//             decoration: const BoxDecoration(
//                 gradient: RadialGradient(
//                   radius: 1.5,
//                   colors: [
//                     Colors.red,
//                     Colors.indigo,
//                   ],
//                 )
//             ),
//             child: currentScreen == 'home-screen'
//                 ? HomeScreen(switcherScreen)
//                 : const QuestionsScreen(),
//           )
//       ),
//     );
//   }
// }