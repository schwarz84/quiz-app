import 'package:flutter/material.dart';

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

  var currentScreen = 'home-screen';

  void switcherScreen() {
    setState(() {
      currentScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {

    Widget activeScreen = HomeScreen(switcherScreen);

    if (currentScreen == 'questions-screen') {
      activeScreen = const QuestionsScreen();
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